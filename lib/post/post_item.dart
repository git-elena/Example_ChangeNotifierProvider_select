// TODO FULL WIDGET into Main Page List Item
import 'package:flutter/material.dart';
import 'package:provider_with_select/post/post_struct.dart';

class ListPostItem extends StatefulWidget {
  const ListPostItem({Key? key,
    required this.item,
    required this.didTap,
    required this.isShowTitle,
  }) : super(key: key);

  final bool isShowTitle;
  final PostStruct item;
  final Function() didTap;
  @override
  State<StatefulWidget> createState() => _ListPostItemState();
}

class _ListPostItemState extends State<ListPostItem> {

  // TODO Did Tap ListItem -> Showing Single VideoPost
  void didTapListItem() {

    /// ## TODO /// didTapListItemToNative(widget.aspect, widget.video_item, widget.title, widget.image_url);
    // SinglePost
    widget.didTap();

  }

  final titleHeight = 24.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.purpleAccent, // TODO <-----------------!!
        width: MediaQuery.of(context).size.width *
            (widget.item.title.isNotEmpty ? .44 : .44),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: // Container(
            // height: globalHeightMainList * .5,
            // color: Colors.yellow,
            //child:
            GestureDetector(
                onTap: () => didTapListItem(),
                child: Container(
                  // margin: const EdgeInsets.only(top: 5),
                  decoration:
                  BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(widget.item.title.isNotEmpty ? 10 : 10)),
                      image: // Image.network(widget.listItem.image_url)),
                      DecorationImage(
                        fit: BoxFit.fitWidth,
                        alignment: FractionalOffset.center,
                        image: NetworkImage(widget.item.featured_image_url),
                      )
                  ),
                )),
            flex: 3,
          ),
          Builder(builder: (BuildContext context) {
            if (widget.item.title.isNotEmpty && widget.isShowTitle) {
              return Expanded(
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        // color: Colors.red,
                        height: titleHeight,
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Text(widget.item.title, overflow: TextOverflow.ellipsis, maxLines: 1,),
                      ),
                    ]),
                flex: 1,
              );
            }
            return SizedBox(height: titleHeight,);
          }),
        ]));
  }
}