import 'package:flutter/material.dart';

import 'package:flutterstarter/generated/i18n.dart';
import 'package:flutterstarter/src/blocs/article_bloc_provider.dart';
import 'package:flutterstarter/src/models/article.dart';
import 'package:flutterstarter/src/ui/widgets/header.dart';
import 'package:flutterstarter/src/ui/widgets/message_card.dart';

class MessageList extends StatefulWidget {
  MessageList();

  @override
  _MessageListState createState() {
    return _MessageListState();
  }
}

class _MessageListState extends State<MessageList> {
  ArticleBloc _bloc;
  bool showBottomBtn = false;

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
        print("offset = ${_scrollController.offset}");
        if (_scrollController.offset > 0 && _scrollController.offset < _scrollController.position.maxScrollExtent) {
          setState(() {
            showBottomBtn = true;
          });
        } else if (_scrollController.offset == _scrollController.position.maxScrollExtent){
          setState(() {
            showBottomBtn = false;
          });
        } else {
          setState(() {
            showBottomBtn = false;
          });
        }
    });
  }

  @override
  void dispose() {
    _bloc.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = ArticleBlocProvider.of(context);

    return FutureBuilder(
            future: _bloc.newsList(),
            builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
              String content;
              if(snapshot.connectionState != ConnectionState.done) {
                content = I18n.of(context).loading;
              }else if(snapshot.hasError) {
                content = I18n.of(context).error;
              }else{
                content = I18n.of(context).empty;
              }
              if (snapshot.hasData) {
                return Expanded(child:
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Header(false, I18n.of(context).menuMessage),
                              Expanded(child:
                                Stack(
                                  children: <Widget>[
                                    buildList(snapshot.data),
                                    if (showBottomBtn)
                                      Container(
                                        width: double.infinity,
                                        alignment: Alignment.bottomRight,
                                        child:
                                          Container(
                                            margin: EdgeInsets.only(right: 12),
                                            width: 40, height: 40,
                                            color: Color(0xFFEBEAEC),
                                            child: new RawMaterialButton(
                                              shape: new CircleBorder(),
                                              elevation: 0.0,
                                              child: new Image(image: new AssetImage('assets/menu_arrow01.png'),
                                                              color: Color(0xFF339C01)),
                                              onPressed: (){
                                                _scrollController.animateTo(
                                                  _scrollController.position.maxScrollExtent,
                                                  curve: Curves.easeOut,
                                                  duration: const Duration(milliseconds: 500),
                                                );
                                              }
                                            )
                                          )
                                      )
                                  ]
                                )
                              )                            ]
                          )
                        );
              }else{
                return Expanded(child:
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Header(false, I18n.of(context).menuMessage),
                                MessageCard(content, ""),
                              ]
                            )
                          );
              }
            });
    
  }

  ListView buildList(List<Article> articles) {
    return ListView.builder(
        controller: _scrollController,
        shrinkWrap: true,
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return MessageCard(articles[index].content, articles[index].date);
        });
  }
}
