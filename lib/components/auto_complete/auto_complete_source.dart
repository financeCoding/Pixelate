// Copyright (c) 2014, the Pixelate Project Authors.
// Please see the AUTHORS file for details. All rights reserved.
// Use of this source code is governed by a zlib license that can be found in
// the LICENSE file.

/// Contains the [AutoCompleteSource] class.
library pixelate_auto_complete;

//---------------------------------------------------------------------
// Standard libraries
//---------------------------------------------------------------------

import 'dart:html' as Html;

//---------------------------------------------------------------------
// Package libraries
//---------------------------------------------------------------------

import 'package:polymer/polymer.dart';

//---------------------------------------------------------------------
// Library Contents
//---------------------------------------------------------------------

/// Tag name for the class.
const String _tagName = 'px-auto-complete-source';

/// An auto complete form control.
@CustomTag(_tagName)
class AutoCompleteSource extends PolymerElement {
  //---------------------------------------------------------------------
  // Member variables
  //---------------------------------------------------------------------
  List<String> data = new List<String>();

  /// The name of the tag.
  static String get customTagName => _tagName;

  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  /// Create an instance of the [AutoComplete] class.
  ///
  /// The constructor should not be called directly. Instead use the
  /// [Element.tag] constructor as follows.
  ///
  ///     var instance = new Element.tag(AutoComplete.customTagName);
  AutoCompleteSource.created()
      : super.created()
  {
    var list = this.querySelector("ul") as Html.UListElement;
    
    if (list != null) {
      this._generateSourceFromElement(list);
    }
  }
  
  void _generateSourceFromElement(Html.UListElement list) {
    list.children.forEach((child) {
      if (child is Html.LIElement) {
        data.add(child.text); 
      }
    });
  }
}
