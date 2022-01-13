﻿Type.registerNamespace("Sys.Extended.UI.Animation");Sys.Extended.UI.Animation.AnimationBehavior=function(n){Sys.Extended.UI.Animation.AnimationBehavior.initializeBase(this,[n]);this._onLoad=null;this._onClick=null;this._onMouseOver=null;this._onMouseOut=null;this._onHoverOver=null;this._onHoverOut=null;this._onClickHandler=null;this._onMouseOverHandler=null;this._onMouseOutHandler=null};Sys.Extended.UI.Animation.AnimationBehavior.prototype={initialize:function(){Sys.Extended.UI.Animation.AnimationBehavior.callBaseMethod(this,"initialize");var n=this.get_element();n&&(this._onClickHandler=Function.createDelegate(this,this.OnClick),$addHandler(n,"click",this._onClickHandler),this._onMouseOverHandler=Function.createDelegate(this,this.OnMouseOver),$addHandler(n,"mouseover",this._onMouseOverHandler),this._onMouseOutHandler=Function.createDelegate(this,this.OnMouseOut),$addHandler(n,"mouseout",this._onMouseOutHandler))},dispose:function(){var n=this.get_element();n&&(this._onClickHandler&&($removeHandler(n,"click",this._onClickHandler),this._onClickHandler=null),this._onMouseOverHandler&&($removeHandler(n,"mouseover",this._onMouseOverHandler),this._onMouseOverHandler=null),this._onMouseOutHandler&&($removeHandler(n,"mouseout",this._onMouseOutHandler),this._onMouseOutHandler=null));this._onLoad=null;this._onClick=null;this._onMouseOver=null;this._onMouseOut=null;this._onHoverOver=null;this._onHoverOut=null;Sys.Extended.UI.Animation.AnimationBehavior.callBaseMethod(this,"dispose")},get_OnLoad:function(){return this._onLoad?this._onLoad.get_json():null},set_OnLoad:function(n){this._onLoad||(this._onLoad=new Sys.Extended.UI.Animation.GenericAnimationBehavior(this.get_element()),this._onLoad.initialize());this._onLoad.set_json(n);this.raisePropertyChanged("OnLoad");this._onLoad.play()},get_OnLoadBehavior:function(){return this._onLoad},get_OnClick:function(){return this._onClick?this._onClick.get_json():null},set_OnClick:function(n){this._onClick||(this._onClick=new Sys.Extended.UI.Animation.GenericAnimationBehavior(this.get_element()),this._onClick.initialize());this._onClick.set_json(n);this.raisePropertyChanged("OnClick")},get_OnClickBehavior:function(){return this._onClick},OnClick:function(){this._onClick&&this._onClick.play()},get_OnMouseOver:function(){return this._onMouseOver?this._onMouseOver.get_json():null},set_OnMouseOver:function(n){this._onMouseOver||(this._onMouseOver=new Sys.Extended.UI.Animation.GenericAnimationBehavior(this.get_element()),this._onMouseOver.initialize());this._onMouseOver.set_json(n);this.raisePropertyChanged("OnMouseOver")},get_OnMouseOverBehavior:function(){return this._onMouseOver},OnMouseOver:function(){this._mouseHasEntered||(this._onMouseOver&&this._onMouseOver.play(),this._onHoverOver&&(this._onHoverOut&&this._onHoverOut.quit(),this._onHoverOver.play()),this._mouseHasEntered=!0)},get_OnMouseOut:function(){return this._onMouseOut?this._onMouseOut.get_json():null},set_OnMouseOut:function(n){this._onMouseOut||(this._onMouseOut=new Sys.Extended.UI.Animation.GenericAnimationBehavior(this.get_element()),this._onMouseOut.initialize());this._onMouseOut.set_json(n);this.raisePropertyChanged("OnMouseOut")},get_OnMouseOutBehavior:function(){return this._onMouseOut},OnMouseOut:function(n){var r=n.rawEvent,t=this.get_element(),u=n.target,i;u.nodeName===t.nodeName&&(i=r.relatedTarget||r.toElement,t==i||this._isChild(t,i)||(this._mouseHasEntered=!1,this._onMouseOut&&this._onMouseOut.play(),this._onHoverOut&&(this._onHoverOver&&this._onHoverOver.quit(),this._onHoverOut.play())))},_isChild:function(n,t){for(var i=document.body;t&&n!=t&&i!=t;)try{t=t.parentNode}catch(r){return!1}return n==t},get_OnHoverOver:function(){return this._onHoverOver?this._onHoverOver.get_json():null},set_OnHoverOver:function(n){this._onHoverOver||(this._onHoverOver=new Sys.Extended.UI.Animation.GenericAnimationBehavior(this.get_element()),this._onHoverOver.initialize());this._onHoverOver.set_json(n);this.raisePropertyChanged("OnHoverOver")},get_OnHoverOverBehavior:function(){return this._onHoverOver},get_OnHoverOut:function(){return this._onHoverOut?this._onHoverOut.get_json():null},set_OnHoverOut:function(n){this._onHoverOut||(this._onHoverOut=new Sys.Extended.UI.Animation.GenericAnimationBehavior(this.get_element()),this._onHoverOut.initialize());this._onHoverOut.set_json(n);this.raisePropertyChanged("OnHoverOut")},get_OnHoverOutBehavior:function(){return this._onHoverOut}};Sys.Extended.UI.Animation.AnimationBehavior.registerClass("Sys.Extended.UI.Animation.AnimationBehavior",Sys.Extended.UI.BehaviorBase);Sys.Extended.UI.Animation.GenericAnimationBehavior=function(n){Sys.Extended.UI.Animation.GenericAnimationBehavior.initializeBase(this,[n]);this._json=null;this._animation=null};Sys.Extended.UI.Animation.GenericAnimationBehavior.prototype={dispose:function(){this.disposeAnimation();Sys.Extended.UI.Animation.GenericAnimationBehavior.callBaseMethod(this,"dispose")},disposeAnimation:function(){this._animation&&this._animation.dispose();this._animation=null},play:function(){this._animation&&!this._animation.get_isPlaying()&&(this.stop(),this._animation.play())},stop:function(){this._animation&&this._animation.get_isPlaying()&&this._animation.stop(!0)},quit:function(){this._animation&&this._animation.get_isPlaying()&&this._animation.stop(!1)},get_json:function(){return this._json},set_json:function(n){if(this._json!=n){this._json=n;this.raisePropertyChanged("json");this.disposeAnimation();var t=this.get_element();t&&(this._animation=Sys.Extended.UI.Animation.buildAnimation(this._json,t),this._animation&&this._animation.initialize(),this.raisePropertyChanged("animation"))}},get_animation:function(){return this._animation}};Sys.Extended.UI.Animation.GenericAnimationBehavior.registerClass("Sys.Extended.UI.Animation.GenericAnimationBehavior",Sys.Extended.UI.BehaviorBase);