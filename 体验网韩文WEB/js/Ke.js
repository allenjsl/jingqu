var keSimple = ['source', '|', 'cut', 'copy', 'paste', 'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
        'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'clearhtml', 'selectall', '|', 'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline', '|', 'table', 'hr', 'emoticons', 'link', 'unlink'];

var keSimple_HaveImage = ['source', '|', 'cut', 'copy', 'paste', 'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
        'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'clearhtml', 'selectall', '|', 'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline', '|', 'table', 'hr', 'emoticons', 'link', 'unlink', '|', 'image'];
var keMore = ['source', '|', 'cut', 'copy', 'paste', 'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
        'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'clearhtml', 'quickformat', 'selectall', '|', 'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline', '|', 'table', 'hr', 'emoticons', 'link', 'unlink'];

var keMore_HaveImage = ['source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'code', 'cut', 'copy', 'paste',
        'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
        'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
        'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
        'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
        'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'multiimage',
        'flash', 'media', 'insertfile', 'table', 'hr', 'emoticons', 'baidumap', 'pagebreak',
        'anchor', 'link', 'unlink', '|', 'about'];

var KEditer = {
    //创建编辑器
    init: function (id, options) {
        var e = { id: id, edit: null }, op = options || { resizeMode: 0, items: keSimple, height: "150px", width: "800px" };
        e.edit = KindEditor.create('#' + id, op);
        KEditer.list.push(e);
    },
    //缓存编辑器对象
    list: [],
    //同步编辑器的值
    sync: function (id) {
        var i = 0, _self = this, e;
        if (_self.list.length > 0) {
            for (; i < _self.list.length; i++) {
                e = _self.list[i];
                if (id) {
                    if (e.id == id) {
                        e.edit.sync();
                        break;
                    }
                } else {
                    if (document.getElementById(e.id) != null) {
                        //同步数据
                        e.edit.sync();
                    } else {
                        //移除
                        _self.list.splice(i, 1);
                    }
                }
            }
        }
    },
    //移除指定编辑器
    remove: function (id) {
        var i = 0, _self = this, e;
        if (_self.list.length > 0) {
            for (; i < _self.list.length; i++) {
                e = _self.list[i];
                if (id == e.id) {
                    e.edit.remove();
                    _self.list.splice(i, 1);
                    break;
                }
            }
        }
    },
    html: function (id, val) {
        var i = 0, _self = this, e;
        if (_self.list.length > 0) {
            for (; i < _self.list.length; i++) {
                e = _self.list[i];
                if (id == e.id) {
                    e.edit.html(val);
                    break;
                }
            }
        }
    },
    isInit: function (id) {
        var _isInit = false;
        for (var i = 0; i < this.list.length; i++) {
            if (this.list[i].id == id) { _isInit = true; break; }
        }
        return _isInit;
    }
};