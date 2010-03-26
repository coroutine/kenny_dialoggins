/**
 * Kenny Dialoggins was programmed with love by Coroutine.
 */

var KennyDialoggins = {};

KennyDialoggins.Dialog = function(content, options) {
    options             = options || {};
    
    this._element       = null;
    this._hideListener  = this._generateHideListener();
    this._is_showing    = false;
    
    this._beforeShow    = options["beforeShow"] || Prototype.emptyFunction
    this._afterShow     = options["afterShow"]  || Prototype.emptyFunction
    this._beforeHide    = options["beforeHide"] || Prototype.emptyFunction
    this._afterHide     = options["afterHide"]  || Prototype.emptyFunction
    
    this._makeDialog();
    this.setContent(content);
    document.body.appendChild(this._element);
}

KennyDialoggins.Dialog.instances = {};
KennyDialoggins.Dialog._POSITION_FN_MAP = $H({
    left:   "getWidth",
    top:    "getHeight"
});

KennyDialoggins.Dialog.show = function(id) {
    var dialog = this.instances[id];
    if(dialog) {
        dialog.show();
    }
    return dialog;
}

KennyDialoggins.Dialog.hide = function(id) {
    var dialog = this.instances[id];
    if(dialog) {
        dialog.hide();
    }
    return dialog;
}

KennyDialoggins.Dialog.is_showing = function(id) {
    var dialog = this.instances[id];
    if(!dialog) throw "No dialog cound be found for the supplied id.";
    return dialog.is_showing();
}

// ----------------------------------------------------------------------------
// Instance methods
// ----------------------------------------------------------------------------

Object.extend(KennyDialoggins.Dialog.prototype, {
    _makeDialog: function() {
        if(!this._element) {
            this._element = new Element("DIV");
            this._element.className = "dialog";
            this._element.hide();
        }
    },
    
    _generateHideListener: function() {
        return function(evt) {
            var origin = evt.findElement(".dialog");
            if(this._element !== origin) {
                this.hide();
            }
        }.bind(this);
    },
    
    setContent: function(content) {
        this._element.update(content);
    },
    
    show: function() {
        new Effect.Appear(this._element, { 
            duration:       0.2,
            beforeStart:    this._beforeShow,
            afterFinish:    function() {
                this._is_showing = true;
                this._afterShow();
                document.observe("click", this._hideListener);
            }.bind(this)
        });
        
        KennyDialoggins.Dialog._POSITION_FN_MAP.each(function(pair) {
            var method = pair.last();
            this._element.style[pair.first()] = 
                (document.viewport[method]() / 2 + document.viewport.getScrollOffsets()[pair.first()] - this._element[method]() / 2) + "px";
        }.bind(this));
    },
    
    hide: function() {
        new Effect.Fade(this._element, {
            duration: 0.2,
            beforeStart:    this._beforeHide,
            afterFinish:    function() {
                this._is_showing = false;
                this._afterHide();
                document.stopObserving("click", this._hideListener);
            }.bind(this)
        });
    },
    
    is_showing: function() {
        return this._is_showing;
    }
});