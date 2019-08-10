import 'package:flutter/material.dart';
import 'package:idea_app/idea_detail_page.dart';
import 'package:idea_app/idea_model.dart';

class IdeaCard extends StatefulWidget {
  final Idea idea;

  IdeaCard(this.idea);

  @override
  IdeaCardState createState() {
    return new IdeaCardState(idea);
  }
}

class IdeaCardState extends State<IdeaCard> {
  Idea idea;
  String renderUrl;

  IdeaCardState(this.idea);

  void initState() {
    super.initState();
    renderDogPic();
  }

  void renderDogPic() async {
    await idea.getImageUrl();
    setState(() {
      renderUrl = idea.imageUrl;
    });
  }

  Widget get dogImage {
    var dogAvatar = new Hero(
      tag: idea,
      child: new Container(
        width: 100.0,
        height: 100.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
            fit: BoxFit.cover,
            image: new NetworkImage(renderUrl ?? ''),
          ),
        ),
      ),
    );

    var placeholder = new Container(
        width: 100.0,
        height: 100.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          gradient: new LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black54, Colors.black, Colors.blueGrey[600]],
          ),
        ),
        alignment: Alignment.center,
        child: new Text(
          'DOGGO',
          textAlign: TextAlign.center,
        ));

    var crossFade = new AnimatedCrossFade(
      firstChild: placeholder,
      secondChild: dogAvatar,
      crossFadeState: renderUrl == null
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: new Duration(milliseconds: 1000),
    );

    return crossFade;
  }

  Widget get dogCard {
    return new Positioned(
      right: 0.0,
      child: new Container(
        width: 290.0,
        height: 115.0,
        child: new Card(
          color: Colors.black87,
          child: new Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 64.0,
            ),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Text(widget.idea.name,
                    style: Theme.of(context).textTheme.headline),
                new Text(widget.idea.location,
                    style: Theme.of(context).textTheme.subhead),
                new Row(
                  children: <Widget>[
                    new Icon(
                      Icons.star,
                    ),
                    new Text(': ${widget.idea.rating} / 10')
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () => showDogDetailPage(),
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: new Container(
          height: 115.0,
          child: new Stack(
            children: <Widget>[
              dogCard,
              new Positioned(top: 7.5, child: dogImage),
            ],
          ),
        ),
      ),
    );
  }

  showDogDetailPage() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new IdeaDetailPage(idea);
    }));
  }
}
