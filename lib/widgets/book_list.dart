import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_complete_guide/models/book.dart';
import 'package:flutter_complete_guide/widgets/utils.dart';
import 'package:flutter_svg/svg.dart';

class BookList extends StatelessWidget {
  final List<Book> _books;

  BookList(this._books);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text("Books"),
              ),
              OutlinedButton(
                child: Row(
                  children: [Icon(Icons.add), Text("Create Book")],
                ),
                onPressed: () {
                  // create new book action
                },
              )
            ],
          ),
          Container(
            width: double.infinity,
            height: 150,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return SizedBox(
                    width: 207,
                    height: 160,
                    child: Card(
                        elevation: 4,
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Container(
                                  child: Text(
                                    "${_books[index].title}",
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyle.medium.copyWith(
                                        fontSize: AppFontSize.large,
                                        color: Color(0xFF575757)
                                    ),
                                  ),
                                  alignment: Alignment.topLeft,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(right: 8),
                                      child: SvgPicture.asset(
                                      "assets/images/incoming.svg"),
                                      width: 30,
                                      height: 30,
                                    ),
                                    Container(child: Text("5,000,000"))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(right: 8),
                                      child: SvgPicture.asset(
                                          "assets/images/outgoing.svg"),
                                      width: 30,
                                      height: 30,
                                    ),
                                    Container(child: Text("35,000,000"))
                                  ],
                                ),
                              ],
                            ))));
              },
              scrollDirection: Axis.horizontal,
              itemCount: _books.length,
            ),
          )
        ],
      ),
    );
  }
}
