/*! randheli 2014-06-18 */
!function (a) {
	"use strict";
	var b,
	c,
	d,
	e,
	f,
	g = a.GreenSockGlobals || a,
	h = function (a) {
		var b,
		c = a.split("."),
		d = g;
		for (b = 0; c.length > b; b++)
			d[c[b]] = d = d[c[b]] || {};
		return d
	},
	i = h("com.greensock"),
	j = [].slice,
	k = function () {},
	l = {},
	m = function (b, c, d, e) {
		this.sc = l[b] ? l[b].sc : [],
		l[b] = this,
		this.gsClass = null,
		this.func = d;
		var f = [];
		this.check = function (i) {
			for (var j, k, n, o, p = c.length, q = p; --p > -1; )
				(j = l[c[p]] || new m(c[p], [])).gsClass ? (f[p] = j.gsClass, q--) : i && j.sc.push(this);
			if (0 === q && d)
				for (k = ("com.greensock." + b).split("."), n = k.pop(), o = h(k.join("."))[n] = this.gsClass = d.apply(d, f), e && (g[n] = o, "function" == typeof define && define.amd ? define((a.GreenSockAMDPath ? a.GreenSockAMDPath + "/" : "") + b.split(".").join("/"), [], function () {
							return o
						}) : "undefined" != typeof module && module.exports && (module.exports = o)), p = 0; this.sc.length > p; p++)
					this.sc[p].check()
		},
		this.check(!0)
	},
	n = a._gsDefine = function (a, b, c, d) {
		return new m(a, b, c, d)
	},
	o = i._class = function (a, b, c) {
		return b = b || function () {},
		n(a, [], function () {
			return b
		}, c),
		b
	};
	n.globals = g;
	var p = [0, 0, 1, 1],
	q = [],
	r = o("easing.Ease", function (a, b, c, d) {
			this._func = a,
			this._type = c || 0,
			this._power = d || 0,
			this._params = b ? p.concat(b) : p
		}, !0),
	s = r.map = {},
	t = r.register = function (a, b, c, d) {
		for (var e, f, g, h, j = b.split(","), k = j.length, l = (c || "easeIn,easeOut,easeInOut").split(","); --k > -1; )
			for (f = j[k], e = d ? o("easing." + f, null, !0) : i.easing[f] || {}, g = l.length; --g > -1; )
				h = l[g], s[f + "." + h] = s[h + f] = e[h] = a.getRatio ? a : a[h] || new a
	};
	for (d = r.prototype, d._calcEnd = !1, d.getRatio = function (a) {
		if (this._func)
			return this._params[0] = a, this._func.apply(null, this._params);
			var b = this._type,
			c = this._power,
			d = 1 === b ? 1 - a : 2 === b ? a : .5 > a ? 2 * a : 2 * (1 - a);
			return 1 === c ? d *= d : 2 === c ? d *= d * d : 3 === c ? d *= d * d * d : 4 === c && (d *= d * d * d * d),
			1 === b ? 1 - d : 2 === b ? d : .5 > a ? d / 2 : 1 - d / 2
		}, b = ["Linear", "Quad", "Cubic", "Quart", "Quint,Strong"], c = b.length; --c > -1; )d = b[c] + ",Power" + c, t(new r(null, null, 1, c), d, "easeOut", !0), t(new r(null, null, 2, c), d, "easeIn" + (0 === c ? ",easeNone" : "")), t(new r(null, null, 3, c), d, "easeInOut");
	s.linear = i.easing.Linear.easeIn,
	s.swing = i.easing.Quad.easeInOut;
	var u = o("events.EventDispatcher", function (a) {
			this._listeners = {},
			this._eventTarget = a || this
		});
	d = u.prototype,
	d.addEventListener = function (a, b, c, d, g) {
		g = g || 0;
		var h,
		i,
		j = this._listeners[a],
		k = 0;
		for (null == j && (this._listeners[a] = j = []), i = j.length; --i > -1; )
			h = j[i], h.c === b && h.s === c ? j.splice(i, 1) : 0 === k && g > h.pr && (k = i + 1);
		j.splice(k, 0, {
			c : b,
			s : c,
			up : d,
			pr : g
		}),
		this !== e || f || e.wake()
	},
	d.removeEventListener = function (a, b) {
		var c,
		d = this._listeners[a];
		if (d)
			for (c = d.length; --c > -1; )
				if (d[c].c === b)
					return void d.splice(c, 1)
	},
	d.dispatchEvent = function (a) {
		var b,
		c,
		d,
		e = this._listeners[a];
		if (e)
			for (b = e.length, c = this._eventTarget; --b > -1; )
				d = e[b], d.up ? d.c.call(d.s || c, {
					type : a,
					target : c
				}) : d.c.call(d.s || c)
	};
	var v = a.requestAnimationFrame,
	w = a.cancelAnimationFrame,
	x = Date.now || function () {
		return (new Date).getTime()
	},
	y = x();
	for (b = ["ms", "moz", "webkit", "o"], c = b.length; --c > -1 && !v; )
		v = a[b[c] + "RequestAnimationFrame"], w = a[b[c] + "CancelAnimationFrame"] || a[b[c] + "CancelRequestAnimationFrame"];
	o("Ticker", function (a, b) {
		var c,
		d,
		g,
		h,
		i,
		j = this,
		l = x(),
		m = b !== !1 && v,
		n = function (a) {
			y = x(),
			j.time = (y - l) / 1e3;
			var b,
			e = j.time - i;
			(!c || e > 0 || a === !0) && (j.frame++, i += e + (e >= h ? .004 : h - e), b = !0),
			a !== !0 && (g = d(n)),
			b && j.dispatchEvent("tick")
		};
		u.call(j),
		this.time = this.frame = 0,
		this.tick = function () {
			n(!0)
		},
		this.sleep = function () {
			null != g && (m && w ? w(g) : clearTimeout(g), d = k, g = null, j === e && (f = !1))
		},
		this.wake = function () {
			null !== g && j.sleep(),
			d = 0 === c ? k : m && v ? v : function (a) {
				return setTimeout(a, 0 | 1e3 * (i - j.time) + 1)
			},
			j === e && (f = !0),
			n(2)
		},
		this.fps = function (a) {
			return arguments.length ? (c = a, h = 1 / (c || 60), i = this.time + h, void j.wake()) : c
		},
		this.useRAF = function (a) {
			return arguments.length ? (j.sleep(), m = a, void j.fps(c)) : m
		},
		j.fps(a),
		setTimeout(function () {
			m && (!g || 5 > j.frame) && j.useRAF(!1)
		}, 1500)
	}),
	d = i.Ticker.prototype = new i.events.EventDispatcher,
	d.constructor = i.Ticker;
	var z = o("core.Animation", function (a, b) {
			if (this.vars = b = b || {}, this._duration = this._totalDuration = a || 0, this._delay = Number(b.delay) || 0, this._timeScale = 1, this._active = b.immediateRender === !0, this.data = b.data, this._reversed = b.reversed === !0, M) {
				f || e.wake();
				var c = this.vars.useFrames ? L : M;
				c.add(this, c._time),
				this.vars.paused && this.paused(!0)
			}
		});
	e = z.ticker = new i.Ticker,
	d = z.prototype,
	d._dirty = d._gc = d._initted = d._paused = !1,
	d._totalTime = d._time = 0,
	d._rawPrevTime = -1,
	d._next = d._last = d._onUpdate = d._timeline = d.timeline = null,
	d._paused = !1;
	var A = function () {
		x() - y > 2e3 && e.wake(),
		setTimeout(A, 2e3)
	};
	A(),
	d.play = function (a, b) {
		return arguments.length && this.seek(a, b),
		this.reversed(!1).paused(!1)
	},
	d.pause = function (a, b) {
		return arguments.length && this.seek(a, b),
		this.paused(!0)
	},
	d.resume = function (a, b) {
		return arguments.length && this.seek(a, b),
		this.paused(!1)
	},
	d.seek = function (a, b) {
		return this.totalTime(Number(a), b !== !1)
	},
	d.restart = function (a, b) {
		return this.reversed(!1).paused(!1).totalTime(a ? -this._delay : 0, b !== !1, !0)
	},
	d.reverse = function (a, b) {
		return arguments.length && this.seek(a || this.totalDuration(), b),
		this.reversed(!0).paused(!1)
	},
	d.render = function () {},
	d.invalidate = function () {
		return this
	},
	d._enabled = function (a, b) {
		return f || e.wake(),
		this._gc = !a,
		this._active = a && !this._paused && this._totalTime > 0 && this._totalTime < this._totalDuration,
		b !== !0 && (a && !this.timeline ? this._timeline.add(this, this._startTime - this._delay) : !a && this.timeline && this._timeline._remove(this, !0)),
		!1
	},
	d._kill = function () {
		return this._enabled(!1, !1)
	},
	d.kill = function (a, b) {
		return this._kill(a, b),
		this
	},
	d._uncache = function (a) {
		for (var b = a ? this : this.timeline; b; )
			b._dirty = !0, b = b.timeline;
		return this
	},
	d._swapSelfInParams = function (a) {
		for (var b = a.length, c = a.concat(); --b > -1; )
			"{self}" === a[b] && (c[b] = this);
		return c
	},
	d.eventCallback = function (a, b, c, d) {
		if ("on" === (a || "").substr(0, 2)) {
			var e = this.vars;
			if (1 === arguments.length)
				return e[a];
			null == b ? delete e[a] : (e[a] = b, e[a + "Params"] = c instanceof Array && -1 !== c.join("").indexOf("{self}") ? this._swapSelfInParams(c) : c, e[a + "Scope"] = d),
			"onUpdate" === a && (this._onUpdate = b)
		}
		return this
	},
	d.delay = function (a) {
		return arguments.length ? (this._timeline.smoothChildTiming && this.startTime(this._startTime + a - this._delay), this._delay = a, this) : this._delay
	},
	d.duration = function (a) {
		return arguments.length ? (this._duration = this._totalDuration = a, this._uncache(!0), this._timeline.smoothChildTiming && this._time > 0 && this._time < this._duration && 0 !== a && this.totalTime(this._totalTime * (a / this._duration), !0), this) : (this._dirty = !1, this._duration)
	},
	d.totalDuration = function (a) {
		return this._dirty = !1,
		arguments.length ? this.duration(a) : this._totalDuration
	},
	d.time = function (a, b) {
		return arguments.length ? (this._dirty && this.totalDuration(), this.totalTime(a > this._duration ? this._duration : a, b)) : this._time
	},
	d.totalTime = function (a, b, c) {
		if (f || e.wake(), !arguments.length)
			return this._totalTime;
		if (this._timeline) {
			if (0 > a && !c && (a += this.totalDuration()), this._timeline.smoothChildTiming) {
				this._dirty && this.totalDuration();
				var d = this._totalDuration,
				g = this._timeline;
				if (a > d && !c && (a = d), this._startTime = (this._paused ? this._pauseTime : g._time) - (this._reversed ? d - a : a) / this._timeScale, g._dirty || this._uncache(!1), g._timeline)
					for (; g._timeline; )
						g._timeline._time !== (g._startTime + g._totalTime) / g._timeScale && g.totalTime(g._totalTime, !0), g = g._timeline
			}
			this._gc && this._enabled(!0, !1),
			this._totalTime !== a && this.render(a, b, !1)
		}
		return this
	},
	d.startTime = function (a) {
		return arguments.length ? (a !== this._startTime && (this._startTime = a, this.timeline && this.timeline._sortChildren && this.timeline.add(this, a - this._delay)), this) : this._startTime
	},
	d.timeScale = function (a) {
		if (!arguments.length)
			return this._timeScale;
		if (a = a || 1e-6, this._timeline && this._timeline.smoothChildTiming) {
			var b = this._pauseTime,
			c = b || 0 === b ? b : this._timeline.totalTime();
			this._startTime = c - (c - this._startTime) * this._timeScale / a
		}
		return this._timeScale = a,
		this._uncache(!1)
	},
	d.reversed = function (a) {
		return arguments.length ? (a != this._reversed && (this._reversed = a, this.totalTime(this._totalTime, !0)), this) : this._reversed
	},
	d.paused = function (a) {
		if (!arguments.length)
			return this._paused;
		if (a != this._paused && this._timeline) {
			f || a || e.wake();
			var b = this._timeline,
			c = b.rawTime(),
			d = c - this._pauseTime;
			!a && b.smoothChildTiming && (this._startTime += d, this._uncache(!1)),
			this._pauseTime = a ? c : null,
			this._paused = a,
			this._active = !a && this._totalTime > 0 && this._totalTime < this._totalDuration,
			a || 0 === d || 0 === this._duration || this.render(b.smoothChildTiming ? this._totalTime : (c - this._startTime) / this._timeScale, !0, !0)
		}
		return this._gc && !a && this._enabled(!0, !1),
		this
	};
	var B = o("core.SimpleTimeline", function (a) {
			z.call(this, 0, a),
			this.autoRemoveChildren = this.smoothChildTiming = !0
		});
	d = B.prototype = new z,
	d.constructor = B,
	d.kill()._gc = !1,
	d._first = d._last = null,
	d._sortChildren = !1,
	d.add = d.insert = function (a, b) {
		var c,
		d;
		if (a._startTime = Number(b || 0) + a._delay, a._paused && this !== a._timeline && (a._pauseTime = a._startTime + (this.rawTime() - a._startTime) / a._timeScale), a.timeline && a.timeline._remove(a, !0), a.timeline = a._timeline = this, a._gc && a._enabled(!0, !0), c = this._last, this._sortChildren)
			for (d = a._startTime; c && c._startTime > d; )
				c = c._prev;
		return c ? (a._next = c._next, c._next = a) : (a._next = this._first, this._first = a),
		a._next ? a._next._prev = a : this._last = a,
		a._prev = c,
		this._timeline && this._uncache(!0),
		this
	},
	d._remove = function (a, b) {
		return a.timeline === this && (b || a._enabled(!1, !0), a.timeline = null, a._prev ? a._prev._next = a._next : this._first === a && (this._first = a._next), a._next ? a._next._prev = a._prev : this._last === a && (this._last = a._prev), this._timeline && this._uncache(!0)),
		this
	},
	d.render = function (a, b, c) {
		var d,
		e = this._first;
		for (this._totalTime = this._time = this._rawPrevTime = a; e; )
			d = e._next, (e._active || a >= e._startTime && !e._paused) && (e._reversed ? e.render((e._dirty ? e.totalDuration() : e._totalDuration) - (a - e._startTime) * e._timeScale, b, c) : e.render((a - e._startTime) * e._timeScale, b, c)), e = d
	},
	d.rawTime = function () {
		return f || e.wake(),
		this._totalTime
	};
	var C = o("TweenLite", function (b, c, d) {
			if (z.call(this, c, d), this.render = C.prototype.render, null == b)
				throw "Cannot tween a null target.";
			this.target = b = "string" != typeof b ? b : C.selector(b) || b;
			var e,
			f,
			g,
			h = b.jquery || b.length && b !== a && b[0] && (b[0] === a || b[0].nodeType && b[0].style && !b.nodeType),
			i = this.vars.overwrite;
			if (this._overwrite = i = null == i ? K[C.defaultOverwrite] : "number" == typeof i ? i >> 0 : K[i], (h || b instanceof Array) && "number" != typeof b[0])
				for (this._targets = g = j.call(b, 0), this._propLookup = [], this._siblings = [], e = 0; g.length > e; e++)
					f = g[e], f ? "string" != typeof f ? f.length && f !== a && f[0] && (f[0] === a || f[0].nodeType && f[0].style && !f.nodeType) ? (g.splice(e--, 1), this._targets = g = g.concat(j.call(f, 0))) : (this._siblings[e] = N(f, this, !1), 1 === i && this._siblings[e].length > 1 && O(f, this, null, 1, this._siblings[e])) : (f = g[e--] = C.selector(f), "string" == typeof f && g.splice(e + 1, 1)) : g.splice(e--, 1);
			else
				this._propLookup = {},
			this._siblings = N(b, this, !1),
			1 === i && this._siblings.length > 1 && O(b, this, null, 1, this._siblings);
			(this.vars.immediateRender || 0 === c && 0 === this._delay && this.vars.immediateRender !== !1) && this.render(-this._delay, !1, !0)
		}, !0),
	D = function (b) {
		return b.length && b !== a && b[0] && (b[0] === a || b[0].nodeType && b[0].style && !b.nodeType)
	},
	E = function (a, b) {
		var c,
		d = {};
		for (c in a)
			J[c] || c in b && "x" !== c && "y" !== c && "width" !== c && "height" !== c && "className" !== c && "border" !== c || !(!G[c] || G[c] && G[c]._autoCSS) || (d[c] = a[c], delete a[c]);
		a.css = d
	};
	d = C.prototype = new z,
	d.constructor = C,
	d.kill()._gc = !1,
	d.ratio = 0,
	d._firstPT = d._targets = d._overwrittenProps = d._startAt = null,
	d._notifyPluginsOfEnabled = !1,
	C.version = "1.10.2",
	C.defaultEase = d._ease = new r(null, null, 1, 1),
	C.defaultOverwrite = "auto",
	C.ticker = e,
	C.autoSleep = !0,
	C.selector = a.$ || a.jQuery || function (b) {
		return a.$ ? (C.selector = a.$, a.$(b)) : a.document ? a.document.getElementById("#" === b.charAt(0) ? b.substr(1) : b) : b
	};
	var F = C._internals = {},
	G = C._plugins = {},
	H = C._tweenLookup = {},
	I = 0,
	J = F.reservedProps = {
		ease : 1,
		delay : 1,
		overwrite : 1,
		onComplete : 1,
		onCompleteParams : 1,
		onCompleteScope : 1,
		useFrames : 1,
		runBackwards : 1,
		startAt : 1,
		onUpdate : 1,
		onUpdateParams : 1,
		onUpdateScope : 1,
		onStart : 1,
		onStartParams : 1,
		onStartScope : 1,
		onReverseComplete : 1,
		onReverseCompleteParams : 1,
		onReverseCompleteScope : 1,
		onRepeat : 1,
		onRepeatParams : 1,
		onRepeatScope : 1,
		easeParams : 1,
		yoyo : 1,
		immediateRender : 1,
		repeat : 1,
		repeatDelay : 1,
		data : 1,
		paused : 1,
		reversed : 1,
		autoCSS : 1
	},
	K = {
		none : 0,
		all : 1,
		auto : 2,
		concurrent : 3,
		allOnStart : 4,
		preexisting : 5,
		"true" : 1,
		"false" : 0
	},
	L = z._rootFramesTimeline = new B,
	M = z._rootTimeline = new B;
	M._startTime = e.time,
	L._startTime = e.frame,
	M._active = L._active = !0,
	z._updateRoot = function () {
		if (M.render((e.time - M._startTime) * M._timeScale, !1, !1), L.render((e.frame - L._startTime) * L._timeScale, !1, !1), !(e.frame % 120)) {
			var a,
			b,
			c;
			for (c in H) {
				for (b = H[c].tweens, a = b.length; --a > -1; )
					b[a]._gc && b.splice(a, 1);
				0 === b.length && delete H[c]
			}
			if (c = M._first, (!c || c._paused) && C.autoSleep && !L._first && 1 === e._listeners.tick.length) {
				for (; c && c._paused; )
					c = c._next;
				c || e.sleep()
			}
		}
	},
	e.addEventListener("tick", z._updateRoot);
	var N = function (a, b, c) {
		var d,
		e,
		f = a._gsTweenID;
		if (H[f || (a._gsTweenID = f = "t" + I++)] || (H[f] = {
					target : a,
					tweens : []
				}), b && (d = H[f].tweens, d[e = d.length] = b, c))
			for (; --e > -1; )
				d[e] === b && d.splice(e, 1);
		return H[f].tweens
	},
	O = function (a, b, c, d, e) {
		var f,
		g,
		h,
		i;
		if (1 === d || d >= 4) {
			for (i = e.length, f = 0; i > f; f++)
				if ((h = e[f]) !== b)
					h._gc || h._enabled(!1, !1) && (g = !0);
				else if (5 === d)
					break;
			return g
		}
		var j,
		k = b._startTime + 1e-10,
		l = [],
		m = 0,
		n = 0 === b._duration;
		for (f = e.length; --f > -1; )
			(h = e[f]) === b || h._gc || h._paused || (h._timeline !== b._timeline ? (j = j || P(b, 0, n), 0 === P(h, j, n) && (l[m++] = h)) : k >= h._startTime && h._startTime + h.totalDuration() / h._timeScale + 1e-10 > k && ((n || !h._initted) && 2e-10 >= k - h._startTime || (l[m++] = h)));
		for (f = m; --f > -1; )
			h = l[f], 2 === d && h._kill(c, a) && (g = !0), (2 !== d || !h._firstPT && h._initted) && h._enabled(!1, !1) && (g = !0);
		return g
	},
	P = function (a, b, c) {
		for (var d = a._timeline, e = d._timeScale, f = a._startTime, g = 1e-10; d._timeline; ) {
			if (f += d._startTime, e *= d._timeScale, d._paused)
				return -100;
			d = d._timeline
		}
		return f /= e,
		f > b ? f - b : c && f === b || !a._initted && 2 * g > f - b ? g : (f += a.totalDuration() / a._timeScale / e) > b + g ? 0 : f - b - g
	};
	d._init = function () {
		var a,
		b,
		c,
		d,
		e = this.vars,
		f = this._overwrittenProps,
		g = this._duration,
		h = e.immediateRender,
		i = e.ease;
		if (e.startAt) {
			if (this._startAt && this._startAt.render(-1, !0), e.startAt.overwrite = 0, e.startAt.immediateRender = !0, this._startAt = C.to(this.target, 0, e.startAt), h)
				if (this._time > 0)
					this._startAt = null;
				else if (0 !== g)
					return
		} else if (e.runBackwards && e.immediateRender && 0 !== g)
			if (this._startAt)
				this._startAt.render(-1, !0), this._startAt = null;
			else if (0 === this._time) {
				c = {};
				for (d in e)
					J[d] && "autoCSS" !== d || (c[d] = e[d]);
				return c.overwrite = 0,
				void(this._startAt = C.to(this.target, 0, c))
			}
		if (this._ease = i ? i instanceof r ? e.easeParams instanceof Array ? i.config.apply(i, e.easeParams) : i : "function" == typeof i ? new r(i, e.easeParams) : s[i] || C.defaultEase : C.defaultEase, this._easeType = this._ease._type, this._easePower = this._ease._power, this._firstPT = null, this._targets)
			for (a = this._targets.length; --a > -1; )
				this._initProps(this._targets[a], this._propLookup[a] = {}, this._siblings[a], f ? f[a] : null) && (b = !0);
		else
			b = this._initProps(this.target, this._propLookup, this._siblings, f);
		if (b && C._onPluginEvent("_onInitAllProps", this), f && (this._firstPT || "function" != typeof this.target && this._enabled(!1, !1)), e.runBackwards)
			for (c = this._firstPT; c; )
				c.s += c.c, c.c = -c.c, c = c._next;
		this._onUpdate = e.onUpdate,
		this._initted = !0
	},
	d._initProps = function (b, c, d, e) {
		var f,
		g,
		h,
		i,
		j,
		k;
		if (null == b)
			return !1;
		this.vars.css || b.style && b !== a && b.nodeType && G.css && this.vars.autoCSS !== !1 && E(this.vars, b);
		for (f in this.vars) {
			if (k = this.vars[f], J[f])
				k instanceof Array && -1 !== k.join("").indexOf("{self}") && (this.vars[f] = k = this._swapSelfInParams(k, this));
			else if (G[f] && (i = new G[f])._onInitTween(b, this.vars[f], this)) {
				for (this._firstPT = j = {
						_next : this._firstPT,
						t : i,
						p : "setRatio",
						s : 0,
						c : 1,
						f : !0,
						n : f,
						pg : !0,
						pr : i._priority
					}, g = i._overwriteProps.length; --g > -1; )
					c[i._overwriteProps[g]] = this._firstPT;
				(i._priority || i._onInitAllProps) && (h = !0),
				(i._onDisable || i._onEnable) && (this._notifyPluginsOfEnabled = !0)
			} else
				this._firstPT = c[f] = j = {
					_next : this._firstPT,
					t : b,
					p : f,
					f : "function" == typeof b[f],
					n : f,
					pg : !1,
					pr : 0
				},
			j.s = j.f ? b[f.indexOf("set") || "function" != typeof b["get" + f.substr(3)] ? f : "get" + f.substr(3)]() : parseFloat(b[f]),
			j.c = "string" == typeof k && "=" === k.charAt(1) ? parseInt(k.charAt(0) + "1", 10) * Number(k.substr(2)) : Number(k) - j.s || 0;
			j && j._next && (j._next._prev = j)
		}
		return e && this._kill(e, b) ? this._initProps(b, c, d, e) : this._overwrite > 1 && this._firstPT && d.length > 1 && O(b, this, c, this._overwrite, d) ? (this._kill(c, b), this._initProps(b, c, d, e)) : h
	},
	d.render = function (a, b, c) {
		var d,
		e,
		f,
		g = this._time;
		if (a >= this._duration)
			this._totalTime = this._time = this._duration, this.ratio = this._ease._calcEnd ? this._ease.getRatio(1) : 1, this._reversed || (d = !0, e = "onComplete"), 0 === this._duration && ((0 === a || 0 > this._rawPrevTime) && this._rawPrevTime !== a && (c = !0, this._rawPrevTime > 0 && (e = "onReverseComplete", b && (a = -1))), this._rawPrevTime = a);
		else if (1e-7 > a)
			this._totalTime = this._time = 0, this.ratio = this._ease._calcEnd ? this._ease.getRatio(0) : 0, (0 !== g || 0 === this._duration && this._rawPrevTime > 0) && (e = "onReverseComplete", d = this._reversed), 0 > a ? (this._active = !1, 0 === this._duration && (this._rawPrevTime >= 0 && (c = !0), this._rawPrevTime = a)) : this._initted || (c = !0);
		else if (this._totalTime = this._time = a, this._easeType) {
			var h = a / this._duration,
			i = this._easeType,
			j = this._easePower;
			(1 === i || 3 === i && h >= .5) && (h = 1 - h),
			3 === i && (h *= 2),
			1 === j ? h *= h : 2 === j ? h *= h * h : 3 === j ? h *= h * h * h : 4 === j && (h *= h * h * h * h),
			this.ratio = 1 === i ? 1 - h : 2 === i ? h : .5 > a / this._duration ? h / 2 : 1 - h / 2
		} else
			this.ratio = this._ease.getRatio(a / this._duration);
		if (this._time !== g || c) {
			if (!this._initted) {
				if (this._init(), !this._initted)
					return;
				this._time && !d ? this.ratio = this._ease.getRatio(this._time / this._duration) : d && this._ease._calcEnd && (this.ratio = this._ease.getRatio(0 === this._time ? 0 : 1))
			}
			for (this._active || !this._paused && this._time !== g && a >= 0 && (this._active = !0), 0 === g && (this._startAt && (a >= 0 ? this._startAt.render(a, b, c) : e || (e = "_dummyGS")), this.vars.onStart && (0 !== this._time || 0 === this._duration) && (b || this.vars.onStart.apply(this.vars.onStartScope || this, this.vars.onStartParams || q))), f = this._firstPT; f; )
				f.f ? f.t[f.p](f.c * this.ratio + f.s) : f.t[f.p] = f.c * this.ratio + f.s, f = f._next;
			this._onUpdate && (0 > a && this._startAt && this._startAt.render(a, b, c), b || this._onUpdate.apply(this.vars.onUpdateScope || this, this.vars.onUpdateParams || q)),
			e && (this._gc || (0 > a && this._startAt && !this._onUpdate && this._startAt.render(a, b, c), d && (this._timeline.autoRemoveChildren && this._enabled(!1, !1), this._active = !1), !b && this.vars[e] && this.vars[e].apply(this.vars[e + "Scope"] || this, this.vars[e + "Params"] || q)))
		}
	},
	d._kill = function (a, b) {
		if ("all" === a && (a = null), null == a && (null == b || b === this.target))
			return this._enabled(!1, !1);
		b = "string" != typeof b ? b || this._targets || this.target : C.selector(b) || b;
		var c,
		d,
		e,
		f,
		g,
		h,
		i,
		j;
		if ((b instanceof Array || D(b)) && "number" != typeof b[0])
			for (c = b.length; --c > -1; )
				this._kill(a, b[c]) && (h = !0);
		else {
			if (this._targets) {
				for (c = this._targets.length; --c > -1; )
					if (b === this._targets[c]) {
						g = this._propLookup[c] || {},
						this._overwrittenProps = this._overwrittenProps || [],
						d = this._overwrittenProps[c] = a ? this._overwrittenProps[c] || {}

						 : "all";
						break
					}
			} else {
				if (b !== this.target)
					return !1;
				g = this._propLookup,
				d = this._overwrittenProps = a ? this._overwrittenProps || {}

				 : "all"
			}
			if (g) {
				i = a || g,
				j = a !== d && "all" !== d && a !== g && (null == a || a._tempKill !== !0);
				for (e in i)
					(f = g[e]) && (f.pg && f.t._kill(i) && (h = !0), f.pg && 0 !== f.t._overwriteProps.length || (f._prev ? f._prev._next = f._next : f === this._firstPT && (this._firstPT = f._next), f._next && (f._next._prev = f._prev), f._next = f._prev = null), delete g[e]), j && (d[e] = 1);
				!this._firstPT && this._initted && this._enabled(!1, !1)
			}
		}
		return h
	},
	d.invalidate = function () {
		return this._notifyPluginsOfEnabled && C._onPluginEvent("_onDisable", this),
		this._firstPT = null,
		this._overwrittenProps = null,
		this._onUpdate = null,
		this._startAt = null,
		this._initted = this._active = this._notifyPluginsOfEnabled = !1,
		this._propLookup = this._targets ? {}

		 : [],
		this
	},
	d._enabled = function (a, b) {
		if (f || e.wake(), a && this._gc) {
			var c,
			d = this._targets;
			if (d)
				for (c = d.length; --c > -1; )
					this._siblings[c] = N(d[c], this, !0);
			else
				this._siblings = N(this.target, this, !0)
		}
		return z.prototype._enabled.call(this, a, b),
		this._notifyPluginsOfEnabled && this._firstPT ? C._onPluginEvent(a ? "_onEnable" : "_onDisable", this) : !1
	},
	C.to = function (a, b, c) {
		return new C(a, b, c)
	},
	C.from = function (a, b, c) {
		return c.runBackwards = !0,
		c.immediateRender = 0 != c.immediateRender,
		new C(a, b, c)
	},
	C.fromTo = function (a, b, c, d) {
		return d.startAt = c,
		d.immediateRender = 0 != d.immediateRender && 0 != c.immediateRender,
		new C(a, b, d)
	},
	C.delayedCall = function (a, b, c, d, e) {
		return new C(b, 0, {
			delay : a,
			onComplete : b,
			onCompleteParams : c,
			onCompleteScope : d,
			onReverseComplete : b,
			onReverseCompleteParams : c,
			onReverseCompleteScope : d,
			immediateRender : !1,
			useFrames : e,
			overwrite : 0
		})
	},
	C.set = function (a, b) {
		return new C(a, 0, b)
	},
	C.killTweensOf = C.killDelayedCallsTo = function (a, b) {
		for (var c = C.getTweensOf(a), d = c.length; --d > -1; )
			c[d]._kill(b, a)
	},
	C.getTweensOf = function (a) {
		if (null == a)
			return [];
		a = "string" != typeof a ? a : C.selector(a) || a;
		var b,
		c,
		d,
		e;
		if ((a instanceof Array || D(a)) && "number" != typeof a[0]) {
			for (b = a.length, c = []; --b > -1; )
				c = c.concat(C.getTweensOf(a[b]));
			for (b = c.length; --b > -1; )
				for (e = c[b], d = b; --d > -1; )
					e === c[d] && c.splice(b, 1)
		} else
			for (c = N(a).concat(), b = c.length; --b > -1; )
				c[b]._gc && c.splice(b, 1);
		return c
	};
	var Q = o("plugins.TweenPlugin", function (a, b) {
			this._overwriteProps = (a || "").split(","),
			this._propName = this._overwriteProps[0],
			this._priority = b || 0,
			this._super = Q.prototype
		}, !0);
	if (d = Q.prototype, Q.version = "1.10.1", Q.API = 2, d._firstPT = null, d._addTween = function (a, b, c, d, e, f) {
		var g,
		h;
		return null != d && (g = "number" == typeof d || "=" !== d.charAt(1) ? Number(d) - c : parseInt(d.charAt(0) + "1", 10) * Number(d.substr(2))) ? (this._firstPT = h = {
				_next : this._firstPT,
				t : a,
				p : b,
				s : c,
				c : g,
				f : "function" == typeof a[b],
				n : e || b,
				r : f
			}, h._next && (h._next._prev = h), h) : void 0
	}, d.setRatio = function (a) {
		for (var b, c = this._firstPT, d = 1e-6; c; )
			b = c.c * a + c.s, c.r ? b = 0 | b + (b > 0 ? .5 :  - .5) : d > b && b > -d && (b = 0), c.f ? c.t[c.p](b)
				 : c.t[c.p] = b, c = c._next
		}, d._kill = function (a) {
			var b,
			c = this._overwriteProps,
			d = this._firstPT;
			if (null != a[this._propName])
				this._overwriteProps = [];
			else
				for (b = c.length; --b > -1; )
					null != a[c[b]] && c.splice(b, 1);
			for (; d; )
				null != a[d.n] && (d._next && (d._next._prev = d._prev), d._prev ? (d._prev._next = d._next, d._prev = null) : this._firstPT === d && (this._firstPT = d._next)), d = d._next;
			return !1
		}, d._roundProps = function (a, b) {
			for (var c = this._firstPT; c; )
				(a[this._propName] || null != c.n && a[c.n.split(this._propName + "_").join("")]) && (c.r = b), c = c._next
		}, C._onPluginEvent = function (a, b) {
			var c,
			d,
			e,
			f,
			g,
			h = b._firstPT;
			if ("_onInitAllProps" === a) {
				for (; h; ) {
					for (g = h._next, d = e; d && d.pr > h.pr; )
						d = d._next;
					(h._prev = d ? d._prev : f) ? h._prev._next = h : e = h,
					(h._next = d) ? d._prev = h : f = h,
					h = g
				}
				h = b._firstPT = e
			}
			for (; h; )
				h.pg && "function" == typeof h.t[a] && h.t[a]() && (c = !0), h = h._next;
			return c
		}, Q.activate = function (a) {
			for (var b = a.length; --b > -1; )
				a[b].API === Q.API && (G[(new a[b])._propName] = a[b]);
			return !0
		}, n.plugin = function (a) {
			if (!(a && a.propName && a.init && a.API))
				throw "illegal plugin definition.";
			var b,
			c = a.propName,
			d = a.priority || 0,
			e = a.overwriteProps,
			f = {
				init : "_onInitTween",
				set : "setRatio",
				kill : "_kill",
				round : "_roundProps",
				initAll : "_onInitAllProps"
			},
			g = o("plugins." + c.charAt(0).toUpperCase() + c.substr(1) + "Plugin", function () {
					Q.call(this, c, d),
					this._overwriteProps = e || []
				}, a.global === !0),
			h = g.prototype = new Q(c);
			h.constructor = g,
			g.API = a.API;
			for (b in f)
				"function" == typeof a[b] && (h[f[b]] = a[b]);
			return g.version = a.version,
			Q.activate([g]),
			g
		}, b = a._gsQueue) {
			for (c = 0; b.length > c; c++)
				b[c]();
			for (d in l)
				l[d].func || a.console.log("GSAP encountered missing dependency: com.greensock." + d)
		}
	f = !1
}
(window), (window._gsQueue || (window._gsQueue = [])).push(function () {
	"use strict";
	window._gsDefine("plugins.CSSPlugin", ["plugins.TweenPlugin", "TweenLite"], function (a, b) {
		var c,
		d,
		e,
		f,
		g = function () {
			a.call(this, "css"),
			this._overwriteProps.length = 0,
			this.setRatio = g.prototype.setRatio
		},
		h = {},
		i = g.prototype = new a("css");
		i.constructor = g,
		g.version = "1.10.2",
		g.API = 2,
		g.defaultTransformPerspective = 0,
		i = "px",
		g.suffixMap = {
			top : i,
			right : i,
			bottom : i,
			left : i,
			width : i,
			height : i,
			fontSize : i,
			padding : i,
			margin : i,
			perspective : i
		};
		var j,
		k,
		l,
		m,
		n,
		o,
		p = /(?:\d|\-\d|\.\d|\-\.\d)+/g,
		q = /(?:\d|\-\d|\.\d|\-\.\d|\+=\d|\-=\d|\+=.\d|\-=\.\d)+/g,
		r = /(?:\+=|\-=|\-|\b)[\d\-\.]+[a-zA-Z0-9]*(?:%|\b)/gi,
		s = /[^\d\-\.]/g,
		t = /(?:\d|\-|\+|=|#|\.)*/g,
		u = /opacity *= *([^)]*)/,
		v = /opacity:([^;]*)/,
		w = /alpha\(opacity *=.+?\)/i,
		x = /^(rgb|hsl)/,
		y = /([A-Z])/g,
		z = /-([a-z])/gi,
		A = /(^(?:url\(\"|url\())|(?:(\"\))$|\)$)/gi,
		B = function (a, b) {
			return b.toUpperCase()
		},
		C = /(?:Left|Right|Width)/i,
		D = /(M11|M12|M21|M22)=[\d\-\.e]+/gi,
		E = /progid\:DXImageTransform\.Microsoft\.Matrix\(.+?\)/i,
		F = /,(?=[^\)]*(?:\(|$))/gi,
		G = Math.PI / 180,
		H = 180 / Math.PI,
		I = {},
		J = document,
		K = J.createElement("div"),
		L = J.createElement("img"),
		M = g._internals = {
			_specialProps : h
		},
		N = navigator.userAgent,
		O = function () {
			var a,
			b = N.indexOf("Android"),
			c = J.createElement("div");
			return l = -1 !== N.indexOf("Safari") && -1 === N.indexOf("Chrome") && (-1 === b || Number(N.substr(b + 8, 1)) > 3),
			n = l && 6 > Number(N.substr(N.indexOf("Version/") + 8, 1)),
			m = -1 !== N.indexOf("Firefox"),
			/MSIE ([0-9]{1,}[\.0-9]{0,})/.exec(N),
			o = parseFloat(RegExp.$1),
			c.innerHTML = "<a style='top:1px;opacity:.55;'>a</a>",
			a = c.getElementsByTagName("a")[0],
			a ? /^0.55/.test(a.style.opacity) : !1
		}
		(),
		P = function (a) {
			return u.test("string" == typeof a ? a : (a.currentStyle ? a.currentStyle.filter : a.style.filter) || "") ? parseFloat(RegExp.$1) / 100 : 1
		},
		Q = function (a) {
			window.console && console.log(a)
		},
		R = "",
		S = "",
		T = function (a, b) {
			b = b || K;
			var c,
			d,
			e = b.style;
			if (void 0 !== e[a])
				return a;
			for (a = a.charAt(0).toUpperCase() + a.substr(1), c = ["O", "Moz", "ms", "Ms", "Webkit"], d = 5; --d > -1 && void 0 === e[c[d] + a]; );
			return d >= 0 ? (S = 3 === d ? "ms" : c[d], R = "-" + S.toLowerCase() + "-", S + a) : null
		},
		U = J.defaultView ? J.defaultView.getComputedStyle : function () {},
		V = g.getStyle = function (a, b, c, d, e) {
			var f;
			return O || "opacity" !== b ? (!d && a.style[b] ? f = a.style[b] : (c = c || U(a, null)) ? (a = c.getPropertyValue(b.replace(y, "-$1").toLowerCase()), f = a || c.length ? a : c[b]) : a.currentStyle && (f = a.currentStyle[b]), null == e || f && "none" !== f && "auto" !== f && "auto auto" !== f ? f : e) : P(a)
		},
		W = function (a, b, c, d, e) {
			if ("px" === d || !d)
				return c;
			if ("auto" === d || !c)
				return 0;
			var f,
			g = C.test(b),
			h = a,
			i = K.style,
			j = 0 > c;
			return j && (c = -c),
			"%" === d && -1 !== b.indexOf("border") ? f = c / 100 * (g ? a.clientWidth : a.clientHeight) : (i.cssText = "border-style:solid; border-width:0; position:absolute; line-height:0;", "%" !== d && h.appendChild ? i[g ? "borderLeftWidth" : "borderTopWidth"] = c + d : (h = a.parentNode || J.body, i[g ? "width" : "height"] = c + d), h.appendChild(K), f = parseFloat(K[g ? "offsetWidth" : "offsetHeight"]), h.removeChild(K), 0 !== f || e || (f = W(a, b, c, d, !0))),
			j ? -f : f
		},
		X = function (a, b, c) {
			if ("absolute" !== V(a, "position", c))
				return 0;
			var d = "left" === b ? "Left" : "Top",
			e = V(a, "margin" + d, c);
			return a["offset" + d] - (W(a, b, parseFloat(e), e.replace(t, "")) || 0)
		},
		Y = function (a, b) {
			var c,
			d,
			e = {};
			if (b = b || U(a, null))
				if (c = b.length)
					for (; --c > -1; )
						e[b[c].replace(z, B)] = b.getPropertyValue(b[c]);
				else
					for (c in b)
						e[c] = b[c];
			else if (b = a.currentStyle || a.style)
				for (c in b)
					e[c.replace(z, B)] = b[c];
			return O || (e.opacity = P(a)),
			d = xb(a, b, !1),
			e.rotation = d.rotation * H,
			e.skewX = d.skewX * H,
			e.scaleX = d.scaleX,
			e.scaleY = d.scaleY,
			e.x = d.x,
			e.y = d.y,
			wb && (e.z = d.z, e.rotationX = d.rotationX * H, e.rotationY = d.rotationY * H, e.scaleZ = d.scaleZ),
			e.filters && delete e.filters,
			e
		},
		Z = function (a, b, c, d, e) {
			var f,
			g,
			h,
			i = {},
			j = a.style;
			for (g in c)
				"cssText" !== g && "length" !== g && isNaN(g) && (b[g] !== (f = c[g]) || e && e[g]) && -1 === g.indexOf("Origin") && ("number" == typeof f || "string" == typeof f) && (i[g] = "auto" !== f || "left" !== g && "top" !== g ? "" !== f && "auto" !== f && "none" !== f || "string" != typeof b[g] || "" === b[g].replace(s, "") ? f : 0 : X(a, g), void 0 !== j[g] && (h = new lb(j, g, j[g], h)));
			if (d)
				for (g in d)
					"className" !== g && (i[g] = d[g]);
			return {
				difs : i,
				firstMPT : h
			}
		},
		$ = {
			width : ["Left", "Right"],
			height : ["Top", "Bottom"]
		},
		_ = ["marginLeft", "marginRight", "marginTop", "marginBottom"],
		ab = function (a, b, c) {
			var d = parseFloat("width" === b ? a.offsetWidth : a.offsetHeight),
			e = $[b],
			f = e.length;
			for (c = c || U(a, null); --f > -1; )
				d -= parseFloat(V(a, "padding" + e[f], c, !0)) || 0, d -= parseFloat(V(a, "border" + e[f] + "Width", c, !0)) || 0;
			return d
		},
		bb = function (a, b) {
			(null == a || "" === a || "auto" === a || "auto auto" === a) && (a = "0 0");
			var c = a.split(" "),
			d = -1 !== a.indexOf("left") ? "0%" : -1 !== a.indexOf("right") ? "100%" : c[0],
			e = -1 !== a.indexOf("top") ? "0%" : -1 !== a.indexOf("bottom") ? "100%" : c[1];
			return null == e ? e = "0" : "center" === e && (e = "50%"),
			("center" === d || isNaN(parseFloat(d)) && -1 === (d + "").indexOf("=")) && (d = "50%"),
			b && (b.oxp = -1 !== d.indexOf("%"), b.oyp = -1 !== e.indexOf("%"), b.oxr = "=" === d.charAt(1), b.oyr = "=" === e.charAt(1), b.ox = parseFloat(d.replace(s, "")), b.oy = parseFloat(e.replace(s, ""))),
			d + " " + e + (c.length > 2 ? " " + c[2] : "")
		},
		cb = function (a, b) {
			return "string" == typeof a && "=" === a.charAt(1) ? parseInt(a.charAt(0) + "1", 10) * parseFloat(a.substr(2)) : parseFloat(a) - parseFloat(b)
		},
		db = function (a, b) {
			return null == a ? b : "string" == typeof a && "=" === a.charAt(1) ? parseInt(a.charAt(0) + "1", 10) * Number(a.substr(2)) + b : parseFloat(a)
		},
		eb = function (a, b, c, d) {
			var e,
			f,
			g,
			h,
			i = 1e-6;
			return null == a ? h = b : "number" == typeof a ? h = a * G : (e = 2 * Math.PI, f = a.split("_"), g = Number(f[0].replace(s, "")) * (-1 === a.indexOf("rad") ? G : 1) - ("=" === a.charAt(1) ? 0 : b), f.length && (d && (d[c] = b + g), -1 !== a.indexOf("short") && (g %= e, g !== g % (e / 2) && (g = 0 > g ? g + e : g - e)), -1 !== a.indexOf("_cw") && 0 > g ? g = (g + 9999999999 * e) % e - (0 | g / e) * e : -1 !== a.indexOf("ccw") && g > 0 && (g = (g - 9999999999 * e) % e - (0 | g / e) * e)), h = b + g),
			i > h && h > -i && (h = 0),
			h
		},
		fb = {
			aqua : [0, 255, 255],
			lime : [0, 255, 0],
			silver : [192, 192, 192],
			black : [0, 0, 0],
			maroon : [128, 0, 0],
			teal : [0, 128, 128],
			blue : [0, 0, 255],
			navy : [0, 0, 128],
			white : [255, 255, 255],
			fuchsia : [255, 0, 255],
			olive : [128, 128, 0],
			yellow : [255, 255, 0],
			orange : [255, 165, 0],
			gray : [128, 128, 128],
			purple : [128, 0, 128],
			green : [0, 128, 0],
			red : [255, 0, 0],
			pink : [255, 192, 203],
			cyan : [0, 255, 255],
			transparent : [255, 255, 255, 0]
		},
		gb = function (a, b, c) {
			return a = 0 > a ? a + 1 : a > 1 ? a - 1 : a,
			0 | 255 * (1 > 6 * a ? b + 6 * (c - b) * a : .5 > a ? c : 2 > 3 * a ? b + 6 * (c - b) * (2 / 3 - a) : b) + .5
		},
		hb = function (a) {
			var b,
			c,
			d,
			e,
			f,
			g;
			return a && "" !== a ? "number" == typeof a ? [a >> 16, 255 & a >> 8, 255 & a] : ("," === a.charAt(a.length - 1) && (a = a.substr(0, a.length - 1)), fb[a] ? fb[a] : "#" === a.charAt(0) ? (4 === a.length && (b = a.charAt(1), c = a.charAt(2), d = a.charAt(3), a = "#" + b + b + c + c + d + d), a = parseInt(a.substr(1), 16), [a >> 16, 255 & a >> 8, 255 & a]) : "hsl" === a.substr(0, 3) ? (a = a.match(p), e = Number(a[0]) % 360 / 360, f = Number(a[1]) / 100, g = Number(a[2]) / 100, c = .5 >= g ? g * (f + 1) : g + f - g * f, b = 2 * g - c, a.length > 3 && (a[3] = Number(a[3])), a[0] = gb(e + 1 / 3, b, c), a[1] = gb(e, b, c), a[2] = gb(e - 1 / 3, b, c), a) : (a = a.match(p) || fb.transparent, a[0] = Number(a[0]), a[1] = Number(a[1]), a[2] = Number(a[2]), a.length > 3 && (a[3] = Number(a[3])), a)) : fb.black
		},
		ib = "(?:\\b(?:(?:rgb|rgba|hsl|hsla)\\(.+?\\))|\\B#.+?\\b";
		for (i in fb)
			ib += "|" + i + "\\b";
		ib = RegExp(ib + ")", "gi");
		var jb = function (a, b, c, d) {
			if (null == a)
				return function (a) {
					return a
				};
			var e,
			f = b ? (a.match(ib) || [""])[0] : "",
			g = a.split(f).join("").match(r) || [],
			h = a.substr(0, a.indexOf(g[0])),
			i = ")" === a.charAt(a.length - 1) ? ")" : "",
			j = -1 !== a.indexOf(" ") ? " " : ",",
			k = g.length,
			l = k > 0 ? g[0].replace(p, "") : "";
			return k ? e = b ? function (a) {
				var b,
				m,
				n,
				o;
				if ("number" == typeof a)
					a += l;
				else if (d && F.test(a)) {
					for (o = a.replace(F, "|").split("|"), n = 0; o.length > n; n++)
						o[n] = e(o[n]);
					return o.join(",")
				}
				if (b = (a.match(ib) || [f])[0], m = a.split(b).join("").match(r) || [], n = m.length, k > n--)
					for (; k > ++n; )
						m[n] = c ? m[0 | (n - 1) / 2] : g[n];
				return h + m.join(j) + j + b + i + (-1 !== a.indexOf("inset") ? " inset" : "")
			}
			 : function (a) {
				var b,
				f,
				m;
				if ("number" == typeof a)
					a += l;
				else if (d && F.test(a)) {
					for (f = a.replace(F, "|").split("|"), m = 0; f.length > m; m++)
						f[m] = e(f[m]);
					return f.join(",")
				}
				if (b = a.match(r) || [], m = b.length, k > m--)
					for (; k > ++m; )
						b[m] = c ? b[0 | (m - 1) / 2] : g[m];
				return h + b.join(j) + i
			}
			 : function (a) {
				return a
			}
		},
		kb = function (a) {
			return a = a.split(","),
			function (b, c, d, e, f, g, h) {
				var i,
				j = (c + "").split(" ");
				for (h = {}, i = 0; 4 > i; i++)
					h[a[i]] = j[i] = j[i] || j[(i - 1) / 2 >> 0];
				return e.parse(b, h, f, g)
			}
		},
		lb = (M._setPluginRatio = function (a) {
			this.plugin.setRatio(a);
			for (var b, c, d, e, f = this.data, g = f.proxy, h = f.firstMPT, i = 1e-6; h; )
				b = g[h.v], h.r ? b = b > 0 ? 0 | b + .5 : 0 | b - .5 : i > b && b > -i && (b = 0), h.t[h.p] = b, h = h._next;
			if (f.autoRotate && (f.autoRotate.rotation = g.rotation), 1 === a)
				for (h = f.firstMPT; h; ) {
					if (c = h.t, c.type) {
						if (1 === c.type) {
							for (e = c.xs0 + c.s + c.xs1, d = 1; c.l > d; d++)
								e += c["xn" + d] + c["xs" + (d + 1)];
							c.e = e
						}
					} else
						c.e = c.s + c.xs0;
					h = h._next
				}
		}, function (a, b, c, d, e) {
			this.t = a,
			this.p = b,
			this.v = c,
			this.r = e,
			d && (d._prev = this, this._next = d)
		}),
		mb = (M._parseToProxy = function (a, b, c, d, e, f) {
			var g,
			h,
			i,
			j,
			k,
			l = d,
			m = {},
			n = {},
			o = c._transform,
			p = I;
			for (c._transform = null, I = b, d = k = c.parse(a, b, d, e), I = p, f && (c._transform = o, l && (l._prev = null, l._prev && (l._prev._next = null))); d && d !== l; ) {
				if (1 >= d.type && (h = d.p, n[h] = d.s + d.c, m[h] = d.s, f || (j = new lb(d, "s", h, j, d.r), d.c = 0), 1 === d.type))
					for (g = d.l; --g > 0; )
						i = "xn" + g, h = d.p + "_" + i, n[h] = d.data[i], m[h] = d[i], f || (j = new lb(d, i, h, j, d.rxp[i]));
				d = d._next
			}
			return {
				proxy : m,
				end : n,
				firstMPT : j,
				pt : k
			}
		}, M.CSSPropTween = function (a, b, d, e, g, h, i, j, k, l, m) {
			this.t = a,
			this.p = b,
			this.s = d,
			this.c = e,
			this.n = i || b,
			a instanceof mb || f.push(this.n),
			this.r = j,
			this.type = h || 0,
			k && (this.pr = k, c = !0),
			this.b = void 0 === l ? d : l,
			this.e = void 0 === m ? d + e : m,
			g && (this._next = g, g._prev = this)
		}),
		nb = g.parseComplex = function (a, b, c, d, e, f, g, h, i, k) {
			c = c || f || "",
			g = new mb(a, b, 0, 0, g, k ? 2 : 1, null, !1, h, c, d),
			d += "";
			var l,
			m,
			n,
			o,
			r,
			s,
			t,
			u,
			v,
			w,
			y,
			z,
			A = c.split(", ").join(",").split(" "),
			B = d.split(", ").join(",").split(" "),
			C = A.length,
			D = j !== !1;
			for ((-1 !== d.indexOf(",") || -1 !== c.indexOf(",")) && (A = A.join(" ").replace(F, ", ").split(" "), B = B.join(" ").replace(F, ", ").split(" "), C = A.length), C !== B.length && (A = (f || "").split(" "), C = A.length), g.plugin = i, g.setRatio = k, l = 0; C > l; l++)
				if (o = A[l], r = B[l], u = parseFloat(o), u || 0 === u)
					g.appendXtra("", u, cb(r, u), r.replace(q, ""), D && -1 !== r.indexOf("px"), !0);
				else if (e && ("#" === o.charAt(0) || fb[o] || x.test(o)))
					z = "," === r.charAt(r.length - 1) ? ")," : ")", o = hb(o), r = hb(r), v = o.length + r.length > 6, v && !O && 0 === r[3] ? (g["xs" + g.l] += g.l ? " transparent" : "transparent", g.e = g.e.split(B[l]).join("transparent")) : (O || (v = !1), g.appendXtra(v ? "rgba(" : "rgb(", o[0], r[0] - o[0], ",", !0, !0).appendXtra("", o[1], r[1] - o[1], ",", !0).appendXtra("", o[2], r[2] - o[2], v ? "," : z, !0), v && (o = 4 > o.length ? 1 : o[3], g.appendXtra("", o, (4 > r.length ? 1 : r[3]) - o, z, !1)));
				else if (s = o.match(p)) {
					if (t = r.match(q), !t || t.length !== s.length)
						return g;
					for (n = 0, m = 0; s.length > m; m++)
						y = s[m], w = o.indexOf(y, n), g.appendXtra(o.substr(n, w - n), Number(y), cb(t[m], y), "", D && "px" === o.substr(w + y.length, 2), 0 === m), n = w + y.length;
					g["xs" + g.l] += o.substr(n)
				} else
					g["xs" + g.l] += g.l ? " " + o : o;
			if (-1 !== d.indexOf("=") && g.data) {
				for (z = g.xs0 + g.data.s, l = 1; g.l > l; l++)
					z += g["xs" + l] + g.data["xn" + l];
				g.e = z + g["xs" + l]
			}
			return g.l || (g.type = -1, g.xs0 = g.e),
			g.xfirst || g
		},
		ob = 9;
		for (i = mb.prototype, i.l = i.pr = 0; --ob > 0; )
			i["xn" + ob] = 0, i["xs" + ob] = "";
		i.xs0 = "",
		i._next = i._prev = i.xfirst = i.data = i.plugin = i.setRatio = i.rxp = null,
		i.appendXtra = function (a, b, c, d, e, f) {
			var g = this,
			h = g.l;
			return g["xs" + h] += f && h ? " " + a : a || "",
			c || 0 === h || g.plugin ? (g.l++, g.type = g.setRatio ? 2 : 1, g["xs" + g.l] = d || "", h > 0 ? (g.data["xn" + h] = b + c, g.rxp["xn" + h] = e, g["xn" + h] = b, g.plugin || (g.xfirst = new mb(g, "xn" + h, b, c, g.xfirst || g, 0, g.n, e, g.pr), g.xfirst.xs0 = 0), g) : (g.data = {
						s : b + c
					}, g.rxp = {}, g.s = b, g.c = c, g.r = e, g)) : (g["xs" + h] += b + (d || ""), g)
		};
		var pb = function (a, b) {
			b = b || {},
			this.p = b.prefix ? T(a) || a : a,
			h[a] = h[this.p] = this,
			this.format = b.formatter || jb(b.defaultValue, b.color, b.collapsible, b.multi),
			b.parser && (this.parse = b.parser),
			this.clrs = b.color,
			this.multi = b.multi,
			this.keyword = b.keyword,
			this.dflt = b.defaultValue,
			this.pr = b.priority || 0
		},
		qb = M._registerComplexSpecialProp = function (a, b, c) {
			"object" != typeof b && (b = {
					parser : c
				});
			var d,
			e,
			f = a.split(","),
			g = b.defaultValue;
			for (c = c || [g], d = 0; f.length > d; d++)
				b.prefix = 0 === d && b.prefix, b.defaultValue = c[d] || g, e = new pb(f[d], b)
		},
		rb = function (a) {
			if (!h[a]) {
				var b = a.charAt(0).toUpperCase() + a.substr(1) + "Plugin";
				qb(a, {
					parser : function (a, c, d, e, f, g, i) {
						var j = (window.GreenSockGlobals || window).com.greensock.plugins[b];
						return j ? (j._cssRegister(), h[d].parse(a, c, d, e, f, g, i)) : (Q("Error: " + b + " js file not loaded."), f)
					}
				})
			}
		};
		i = pb.prototype,
		i.parseComplex = function (a, b, c, d, e, f) {
			var g,
			h,
			i,
			j,
			k,
			l,
			m = this.keyword;
			if (this.multi && (F.test(c) || F.test(b) ? (h = b.replace(F, "|").split("|"), i = c.replace(F, "|").split("|")) : m && (h = [b], i = [c])), i) {
				for (j = i.length > h.length ? i.length : h.length, g = 0; j > g; g++)
					b = h[g] = h[g] || this.dflt, c = i[g] = i[g] || this.dflt, m && (k = b.indexOf(m), l = c.indexOf(m), k !== l && (c = -1 === l ? i : h, c[g] += " " + m));
				b = h.join(", "),
				c = i.join(", ")
			}
			return nb(a, this.p, b, c, this.clrs, this.dflt, d, this.pr, e, f)
		},
		i.parse = function (a, b, c, d, f, g) {
			return this.parseComplex(a.style, this.format(V(a, this.p, e, !1, this.dflt)), this.format(b), f, g)
		},
		g.registerSpecialProp = function (a, b, c) {
			qb(a, {
				parser : function (a, d, e, f, g, h) {
					var i = new mb(a, e, 0, 0, g, 2, e, !1, c);
					return i.plugin = h,
					i.setRatio = b(a, d, f._tween, e),
					i
				},
				priority : c
			})
		};
		var sb = "scaleX,scaleY,scaleZ,x,y,z,skewX,rotation,rotationX,rotationY,perspective".split(","),
		tb = T("transform"),
		ub = R + "transform",
		vb = T("transformOrigin"),
		wb = null !== T("perspective"),
		xb = function (a, b, c, d) {
			if (a._gsTransform && c && !d)
				return a._gsTransform;
			var e,
			f,
			h,
			i,
			j,
			k,
			l,
			m,
			n,
			o,
			p,
			q,
			r,
			s = c ? a._gsTransform || {
				skewY : 0
			}
			 : {
				skewY : 0
			},
			t = 0 > s.scaleX,
			u = 2e-5,
			v = 1e5,
			w = -Math.PI + 1e-4,
			x = Math.PI - 1e-4,
			y = wb ? parseFloat(V(a, vb, b, !1, "0 0 0").split(" ")[2]) || s.zOrigin || 0 : 0;
			for (tb ? e = V(a, ub, b, !0) : a.currentStyle && (e = a.currentStyle.filter.match(D), e = e && 4 === e.length ? [e[0].substr(4), Number(e[2].substr(4)), Number(e[1].substr(4)), e[3].substr(4), s.x || 0, s.y || 0].join(",") : ""), f = (e || "").match(/(?:\-|\b)[\d\-\.e]+\b/gi) || [], h = f.length; --h > -1; )
				i = Number(f[h]), f[h] = (j = i - (i |= 0)) ? (0 | j * v + (0 > j ?  - .5 : .5)) / v + i : i;
			if (16 === f.length) {
				var z = f[8],
				A = f[9],
				B = f[10],
				C = f[12],
				E = f[13],
				F = f[14];
				if (s.zOrigin && (F = -s.zOrigin, C = z * F - f[12], E = A * F - f[13], F = B * F + s.zOrigin - f[14]), !c || d || null == s.rotationX) {
					var G,
					H,
					I,
					J,
					K,
					L,
					M,
					N = f[0],
					O = f[1],
					P = f[2],
					Q = f[3],
					R = f[4],
					S = f[5],
					T = f[6],
					U = f[7],
					W = f[11],
					X = s.rotationX = Math.atan2(T, B),
					Y = w > X || X > x;
					X && (J = Math.cos(-X), K = Math.sin(-X), G = R * J + z * K, H = S * J + A * K, I = T * J + B * K, z = R * -K + z * J, A = S * -K + A * J, B = T * -K + B * J, W = U * -K + W * J, R = G, S = H, T = I),
					X = s.rotationY = Math.atan2(z, N),
					X && (L = w > X || X > x, J = Math.cos(-X), K = Math.sin(-X), G = N * J - z * K, H = O * J - A * K, I = P * J - B * K, A = O * K + A * J, B = P * K + B * J, W = Q * K + W * J, N = G, O = H, P = I),
					X = s.rotation = Math.atan2(O, S),
					X && (M = w > X || X > x, J = Math.cos(-X), K = Math.sin(-X), N = N * J + R * K, H = O * J + S * K, S = O * -K + S * J, T = P * -K + T * J, O = H),
					M && Y ? s.rotation = s.rotationX = 0 : M && L ? s.rotation = s.rotationY = 0 : L && Y && (s.rotationY = s.rotationX = 0),
					s.scaleX = (0 | Math.sqrt(N * N + O * O) * v + .5) / v,
					s.scaleY = (0 | Math.sqrt(S * S + A * A) * v + .5) / v,
					s.scaleZ = (0 | Math.sqrt(T * T + B * B) * v + .5) / v,
					s.skewX = 0,
					s.perspective = W ? 1 / (0 > W ? -W : W) : 0,
					s.x = C,
					s.y = E,
					s.z = F
				}
			} else if (!(wb && !d && f.length && s.x === f[4] && s.y === f[5] && (s.rotationX || s.rotationY) || void 0 !== s.x && "none" === V(a, "display", b))) {
				var Z = f.length >= 6,
				$ = Z ? f[0] : 1,
				_ = f[1] || 0,
				ab = f[2] || 0,
				bb = Z ? f[3] : 1;
				s.x = f[4] || 0,
				s.y = f[5] || 0,
				k = Math.sqrt($ * $ + _ * _),
				l = Math.sqrt(bb * bb + ab * ab),
				m = $ || _ ? Math.atan2(_, $) : s.rotation || 0,
				n = ab || bb ? Math.atan2(ab, bb) + m : s.skewX || 0,
				o = k - Math.abs(s.scaleX || 0),
				p = l - Math.abs(s.scaleY || 0),
				Math.abs(n) > Math.PI / 2 && Math.abs(n) < 1.5 * Math.PI && (t ? (k *= -1, n += 0 >= m ? Math.PI : -Math.PI, m += 0 >= m ? Math.PI : -Math.PI) : (l *= -1, n += 0 >= n ? Math.PI : -Math.PI)),
				q = (m - s.rotation) % Math.PI,
				r = (n - s.skewX) % Math.PI,
				(void 0 === s.skewX || o > u || -u > o || p > u || -u > p || q > w && x > q && !1 | q * v || r > w && x > r && !1 | r * v) && (s.scaleX = k, s.scaleY = l, s.rotation = m, s.skewX = n),
				wb && (s.rotationX = s.rotationY = s.z = 0, s.perspective = parseFloat(g.defaultTransformPerspective) || 0, s.scaleZ = 1)
			}
			s.zOrigin = y;
			for (h in s)
				u > s[h] && s[h] > -u && (s[h] = 0);
			return c && (a._gsTransform = s),
			s
		},
		yb = function (a) {
			var b,
			c,
			d = this.data,
			e = -d.rotation,
			f = e + d.skewX,
			g = 1e5,
			h = (0 | Math.cos(e) * d.scaleX * g) / g,
			i = (0 | Math.sin(e) * d.scaleX * g) / g,
			j = (0 | Math.sin(f) * -d.scaleY * g) / g,
			k = (0 | Math.cos(f) * d.scaleY * g) / g,
			l = this.t.style,
			m = this.t.currentStyle;
			if (m) {
				c = i,
				i = -j,
				j = -c,
				b = m.filter,
				l.filter = "";
				var n,
				p,
				q = this.t.offsetWidth,
				r = this.t.offsetHeight,
				s = "absolute" !== m.position,
				v = "progid:DXImageTransform.Microsoft.Matrix(M11=" + h + ", M12=" + i + ", M21=" + j + ", M22=" + k,
				w = d.x,
				x = d.y;
				if (null != d.ox && (n = (d.oxp ? .01 * q * d.ox : d.ox) - q / 2, p = (d.oyp ? .01 * r * d.oy : d.oy) - r / 2, w += n - (n * h + p * i), x += p - (n * j + p * k)), s)
					n = q / 2, p = r / 2, v += ", Dx=" + (n - (n * h + p * i) + w) + ", Dy=" + (p - (n * j + p * k) + x) + ")";
				else {
					var y,
					z,
					A,
					B = 8 > o ? 1 : -1;
					for (n = d.ieOffsetX || 0, p = d.ieOffsetY || 0, d.ieOffsetX = Math.round((q - ((0 > h ? -h : h) * q + (0 > i ? -i : i) * r)) / 2 + w), d.ieOffsetY = Math.round((r - ((0 > k ? -k : k) * r + (0 > j ? -j : j) * q)) / 2 + x), ob = 0; 4 > ob; ob++)
						z = _[ob], y = m[z], c = -1 !== y.indexOf("px") ? parseFloat(y) : W(this.t, z, parseFloat(y), y.replace(t, "")) || 0, A = c !== d[z] ? 2 > ob ? -d.ieOffsetX : -d.ieOffsetY : 2 > ob ? n - d.ieOffsetX : p - d.ieOffsetY, l[z] = (d[z] = Math.round(c - A * (0 === ob || 2 === ob ? 1 : B))) + "px";
					v += ", sizingMethod='auto expand')"
				}
				l.filter = -1 !== b.indexOf("DXImageTransform.Microsoft.Matrix(") ? b.replace(E, v) : v + " " + b,
				(0 === a || 1 === a) && 1 === h && 0 === i && 0 === j && 1 === k && (s && -1 === v.indexOf("Dx=0, Dy=0") || u.test(b) && 100 !== parseFloat(RegExp.$1) || -1 === b.indexOf("gradient(") && l.removeAttribute("filter"))
			}
		},
		zb = function () {
			var a,
			b,
			c,
			d,
			e,
			f,
			g,
			h,
			i,
			j,
			k,
			l,
			n,
			o,
			p,
			q,
			r,
			s,
			t,
			u,
			v,
			w,
			x,
			y,
			z,
			A,
			B,
			C = this.data,
			D = this.t.style,
			E = C.rotation,
			F = C.scaleX,
			G = C.scaleY,
			H = C.scaleZ;
			if (m && (z = D.top ? "top" : D.bottom ? "bottom" : parseFloat(V(this.t, "top", null, !1)) ? "bottom" : "top", v = V(this.t, z, null, !1), A = parseFloat(v) || 0, B = v.substr((A + "").length) || "px", C._ffFix = !C._ffFix, D[z] = (C._ffFix ? A + .05 : A - .05) + B), E || C.skewX)
				t = Math.cos(E), u = Math.sin(E), a = t, e = u, C.skewX && (E -= C.skewX, t = Math.cos(E), u = Math.sin(E)), b = -u, f = t;
			else {
				if (!C.rotationY && !C.rotationX && 1 === H)
					return void(D[tb] = "translate3d(" + C.x + "px," + C.y + "px," + C.z + "px)" + (1 !== F || 1 !== G ? " scale(" + F + "," + G + ")" : ""));
				a = f = 1,
				b = e = 0
			}
			k = 1,
			c = d = g = h = i = j = l = n = o = 0,
			q = C.perspective,
			p = q ? -1 / q : 0,
			r = C.zOrigin,
			s = 1e5,
			E = C.rotationY,
			E && (t = Math.cos(E), u = Math.sin(E), i = k * -u, n = p * -u, c = a * u, g = e * u, k *= t, p *= t, a *= t, e *= t),
			E = C.rotationX,
			E && (t = Math.cos(E), u = Math.sin(E), v = b * t + c * u, w = f * t + g * u, x = j * t + k * u, y = o * t + p * u, c = b * -u + c * t, g = f * -u + g * t, k = j * -u + k * t, p = o * -u + p * t, b = v, f = w, j = x, o = y),
			1 !== H && (c *= H, g *= H, k *= H, p *= H),
			1 !== G && (b *= G, f *= G, j *= G, o *= G),
			1 !== F && (a *= F, e *= F, i *= F, n *= F),
			r && (l -= r, d = c * l, h = g * l, l = k * l + r),
			d = (v = (d += C.x) - (d |= 0)) ? (0 | v * s + (0 > v ?  - .5 : .5)) / s + d : d,
			h = (v = (h += C.y) - (h |= 0)) ? (0 | v * s + (0 > v ?  - .5 : .5)) / s + h : h,
			l = (v = (l += C.z) - (l |= 0)) ? (0 | v * s + (0 > v ?  - .5 : .5)) / s + l : l,
			D[tb] = "matrix3d(" + [(0 | a * s) / s, (0 | e * s) / s, (0 | i * s) / s, (0 | n * s) / s, (0 | b * s) / s, (0 | f * s) / s, (0 | j * s) / s, (0 | o * s) / s, (0 | c * s) / s, (0 | g * s) / s, (0 | k * s) / s, (0 | p * s) / s, d, h, l, q ? 1 + -l / q : 1].join(",") + ")"
		},
		Ab = function () {
			var a,
			b,
			c,
			d,
			e,
			f,
			g,
			h,
			i,
			j = this.data,
			k = this.t,
			l = k.style;
			m && (a = l.top ? "top" : l.bottom ? "bottom" : parseFloat(V(k, "top", null, !1)) ? "bottom" : "top", b = V(k, a, null, !1), c = parseFloat(b) || 0, d = b.substr((c + "").length) || "px", j._ffFix = !j._ffFix, l[a] = (j._ffFix ? c + .05 : c - .05) + d),
			j.rotation || j.skewX ? (e = j.rotation, f = e - j.skewX, g = 1e5, h = j.scaleX * g, i = j.scaleY * g, l[tb] = "matrix(" + (0 | Math.cos(e) * h) / g + "," + (0 | Math.sin(e) * h) / g + "," + (0 | Math.sin(f) * -i) / g + "," + (0 | Math.cos(f) * i) / g + "," + j.x + "," + j.y + ")") : l[tb] = "matrix(" + j.scaleX + ",0,0," + j.scaleY + "," + j.x + "," + j.y + ")"
		};
		qb("transform,scale,scaleX,scaleY,scaleZ,x,y,z,rotation,rotationX,rotationY,rotationZ,skewX,skewY,shortRotation,shortRotationX,shortRotationY,shortRotationZ,transformOrigin,transformPerspective,directionalRotation,parseTransform,force3D", {
			parser : function (a, b, c, d, f, g, h) {
				if (d._transform)
					return f;
				var i,
				j,
				k,
				l,
				m,
				n,
				o,
				p = d._transform = xb(a, e, !0, h.parseTransform),
				q = a.style,
				r = 1e-6,
				s = sb.length,
				t = h,
				u = {};
				if ("string" == typeof t.transform && tb)
					k = q.cssText, q[tb] = t.transform, q.display = "block", i = xb(a, null, !1), q.cssText = k;
				else if ("object" == typeof t) {
					if (i = {
							scaleX : db(null != t.scaleX ? t.scaleX : t.scale, p.scaleX),
							scaleY : db(null != t.scaleY ? t.scaleY : t.scale, p.scaleY),
							scaleZ : db(null != t.scaleZ ? t.scaleZ : t.scale, p.scaleZ),
							x : db(t.x, p.x),
							y : db(t.y, p.y),
							z : db(t.z, p.z),
							perspective : db(t.transformPerspective, p.perspective)
						}, o = t.directionalRotation, null != o)
						if ("object" == typeof o)
							for (k in o)
								t[k] = o[k];
						else
							t.rotation = o;
					i.rotation = eb("rotation" in t ? t.rotation : "shortRotation" in t ? t.shortRotation + "_short" : "rotationZ" in t ? t.rotationZ : p.rotation * H, p.rotation, "rotation", u),
					wb && (i.rotationX = eb("rotationX" in t ? t.rotationX : "shortRotationX" in t ? t.shortRotationX + "_short" : p.rotationX * H || 0, p.rotationX, "rotationX", u), i.rotationY = eb("rotationY" in t ? t.rotationY : "shortRotationY" in t ? t.shortRotationY + "_short" : p.rotationY * H || 0, p.rotationY, "rotationY", u)),
					i.skewX = null == t.skewX ? p.skewX : eb(t.skewX, p.skewX),
					i.skewY = null == t.skewY ? p.skewY : eb(t.skewY, p.skewY),
					(j = i.skewY - p.skewY) && (i.skewX += j, i.rotation += j)
				}
				for (null != t.force3D && (p.force3D = t.force3D, n = !0), m = p.force3D || p.z || p.rotationX || p.rotationY || i.z || i.rotationX || i.rotationY || i.perspective, m || null == t.scale || (i.scaleZ = 1); --s > -1; )
					c = sb[s], l = i[c] - p[c], (l > r || -r > l || null != I[c]) && (n = !0, f = new mb(p, c, p[c], l, f), c in u && (f.e = u[c]), f.xs0 = 0, f.plugin = g, d._overwriteProps.push(f.n));
				return l = t.transformOrigin,
				(l || wb && m && p.zOrigin) && (tb ? (n = !0, c = vb, l = (l || V(a, c, e, !1, "50% 50%")) + "", f = new mb(q, c, 0, 0, f, -1, "transformOrigin"), f.b = q[c], f.plugin = g, wb ? (k = p.zOrigin, l = l.split(" "), p.zOrigin = (l.length > 2 && (0 === k || "0px" !== l[2]) ? parseFloat(l[2]) : k) || 0, f.xs0 = f.e = q[c] = l[0] + " " + (l[1] || "50%") + " 0px", f = new mb(p, "zOrigin", 0, 0, f, -1, f.n), f.b = k, f.xs0 = f.e = p.zOrigin) : f.xs0 = f.e = q[c] = l) : bb(l + "", p)),
				n && (d._transformType = m || 3 === this._transformType ? 3 : 2),
				f
			},
			prefix : !0
		}),
		qb("boxShadow", {
			defaultValue : "0px 0px 0px 0px #999",
			prefix : !0,
			color : !0,
			multi : !0,
			keyword : "inset"
		}),
		qb("borderRadius", {
			defaultValue : "0px",
			parser : function (a, b, c, f, g) {
				b = this.format(b);
				var h,
				i,
				j,
				k,
				l,
				m,
				n,
				o,
				p,
				q,
				r,
				s,
				t,
				u,
				v,
				w,
				x = ["borderTopLeftRadius", "borderTopRightRadius", "borderBottomRightRadius", "borderBottomLeftRadius"],
				y = a.style;
				for (p = parseFloat(a.offsetWidth), q = parseFloat(a.offsetHeight), h = b.split(" "), i = 0; x.length > i; i++)
					this.p.indexOf("border") && (x[i] = T(x[i])), l = k = V(a, x[i], e, !1, "0px"), -1 !== l.indexOf(" ") && (k = l.split(" "), l = k[0], k = k[1]), m = j = h[i], n = parseFloat(l), s = l.substr((n + "").length), t = "=" === m.charAt(1), t ? (o = parseInt(m.charAt(0) + "1", 10), m = m.substr(2), o *= parseFloat(m), r = m.substr((o + "").length - (0 > o ? 1 : 0)) || "") : (o = parseFloat(m), r = m.substr((o + "").length)), "" === r && (r = d[c] || s), r !== s && (u = W(a, "borderLeft", n, s), v = W(a, "borderTop", n, s), "%" === r ? (l = 100 * (u / p) + "%", k = 100 * (v / q) + "%") : "em" === r ? (w = W(a, "borderLeft", 1, "em"), l = u / w + "em", k = v / w + "em") : (l = u + "px", k = v + "px"), t && (m = parseFloat(l) + o + r, j = parseFloat(k) + o + r)), g = nb(y, x[i], l + " " + k, m + " " + j, !1, "0px", g);
				return g
			},
			prefix : !0,
			formatter : jb("0px 0px 0px 0px", !1, !0)
		}),
		qb("backgroundPosition", {
			defaultValue : "0 0",
			parser : function (a, b, c, d, f, g) {
				var h,
				i,
				j,
				k,
				l,
				m,
				n = "background-position",
				p = e || U(a, null),
				q = this.format((p ? o ? p.getPropertyValue(n + "-x") + " " + p.getPropertyValue(n + "-y") : p.getPropertyValue(n) : a.currentStyle.backgroundPositionX + " " + a.currentStyle.backgroundPositionY) || "0 0"),
				r = this.format(b);
				if (-1 !== q.indexOf("%") != (-1 !== r.indexOf("%")) && (m = V(a, "backgroundImage").replace(A, ""), m && "none" !== m)) {
					for (h = q.split(" "), i = r.split(" "), L.setAttribute("src", m), j = 2; --j > -1; )
						q = h[j], k = -1 !== q.indexOf("%"), k !== (-1 !== i[j].indexOf("%")) && (l = 0 === j ? a.offsetWidth - L.width : a.offsetHeight - L.height, h[j] = k ? parseFloat(q) / 100 * l + "px" : 100 * (parseFloat(q) / l) + "%");
					q = h.join(" ")
				}
				return this.parseComplex(a.style, q, r, f, g)
			},
			formatter : bb
		}),
		qb("backgroundSize", {
			defaultValue : "0 0",
			formatter : bb
		}),
		qb("perspective", {
			defaultValue : "0px",
			prefix : !0
		}),
		qb("perspectiveOrigin", {
			defaultValue : "50% 50%",
			prefix : !0
		}),
		qb("transformStyle", {
			prefix : !0
		}),
		qb("backfaceVisibility", {
			prefix : !0
		}),
		qb("margin", {
			parser : kb("marginTop,marginRight,marginBottom,marginLeft")
		}),
		qb("padding", {
			parser : kb("paddingTop,paddingRight,paddingBottom,paddingLeft")
		}),
		qb("clip", {
			defaultValue : "rect(0px,0px,0px,0px)",
			parser : function (a, b, c, d, f, g) {
				var h,
				i,
				j;
				return 9 > o ? (i = a.currentStyle, j = 8 > o ? " " : ",", h = "rect(" + i.clipTop + j + i.clipRight + j + i.clipBottom + j + i.clipLeft + ")", b = this.format(b).split(",").join(j)) : (h = this.format(V(a, this.p, e, !1, this.dflt)), b = this.format(b)),
				this.parseComplex(a.style, h, b, f, g)
			}
		}),
		qb("textShadow", {
			defaultValue : "0px 0px 0px #999",
			color : !0,
			multi : !0
		}),
		qb("autoRound,strictUnits", {
			parser : function (a, b, c, d, e) {
				return e
			}
		}),
		qb("border", {
			defaultValue : "0px solid #000",
			parser : function (a, b, c, d, f, g) {
				return this.parseComplex(a.style, this.format(V(a, "borderTopWidth", e, !1, "0px") + " " + V(a, "borderTopStyle", e, !1, "solid") + " " + V(a, "borderTopColor", e, !1, "#000")), this.format(b), f, g)
			},
			color : !0,
			formatter : function (a) {
				var b = a.split(" ");
				return b[0] + " " + (b[1] || "solid") + " " + (a.match(ib) || ["#000"])[0]
			}
		}),
		qb("float,cssFloat,styleFloat", {
			parser : function (a, b, c, d, e) {
				var f = a.style,
				g = "cssFloat" in f ? "cssFloat" : "styleFloat";
				return new mb(f, g, 0, 0, e, -1, c, !1, 0, f[g], b)
			}
		});
		var Bb = function (a) {
			var b,
			c = this.t,
			d = c.filter || V(this.data, "filter"),
			e = 0 | this.s + this.c * a;
			100 === e && (-1 === d.indexOf("atrix(") && -1 === d.indexOf("radient(") ? (c.removeAttribute("filter"), b = !V(this.data, "filter")) : (c.filter = d.replace(w, ""), b = !0)),
			b || (this.xn1 && (c.filter = d = d || "alpha(opacity=" + e + ")"), -1 === d.indexOf("opacity") ? 0 === e && this.xn1 || (c.filter += " alpha(opacity=" + e + ")") : c.filter = d.replace(u, "opacity=" + e))
		};
		qb("opacity,alpha,autoAlpha", {
			defaultValue : "1",
			parser : function (a, b, c, d, f, g) {
				var h = parseFloat(V(a, "opacity", e, !1, "1")),
				i = a.style,
				j = "autoAlpha" === c;
				return b = parseFloat(b),
				j && 1 === h && "hidden" === V(a, "visibility", e) && 0 !== b && (h = 0),
				O ? f = new mb(i, "opacity", h, b - h, f) : (f = new mb(i, "opacity", 100 * h, 100 * (b - h), f), f.xn1 = j ? 1 : 0, i.zoom = 1, f.type = 2, f.b = "alpha(opacity=" + f.s + ")", f.e = "alpha(opacity=" + (f.s + f.c) + ")", f.data = a, f.plugin = g, f.setRatio = Bb),
				j && (f = new mb(i, "visibility", 0, 0, f, -1, null, !1, 0, 0 !== h ? "inherit" : "hidden", 0 === b ? "hidden" : "inherit"), f.xs0 = "inherit", d._overwriteProps.push(f.n)),
				f
			}
		});
		var Cb = function (a, b) {
			b && (a.removeProperty ? a.removeProperty(b.replace(y, "-$1").toLowerCase()) : a.removeAttribute(b))
		},
		Db = function (a) {
			if (this.t._gsClassPT = this, 1 === a || 0 === a) {
				this.t.className = 0 === a ? this.b : this.e;
				for (var b = this.data, c = this.t.style; b; )
					b.v ? c[b.p] = b.v : Cb(c, b.p), b = b._next;
				1 === a && this.t._gsClassPT === this && (this.t._gsClassPT = null)
			} else
				this.t.className !== this.e && (this.t.className = this.e)
		};
		qb("className", {
			parser : function (a, b, d, f, g, h, i) {
				var j,
				k,
				l,
				m,
				n,
				o = a.className,
				p = a.style.cssText;
				if (g = f._classNamePT = new mb(a, d, 0, 0, g, 2), g.setRatio = Db, g.pr = -11, c = !0, g.b = o, k = Y(a, e), l = a._gsClassPT) {
					for (m = {}, n = l.data; n; )
						m[n.p] = 1, n = n._next;
					l.setRatio(1)
				}
				return a._gsClassPT = g,
				g.e = "=" !== b.charAt(1) ? b : o.replace(RegExp("\\s*\\b" + b.substr(2) + "\\b"), "") + ("+" === b.charAt(0) ? " " + b.substr(2) : ""),
				f._tween._duration && (a.className = g.e, j = Z(a, k, Y(a), i, m), a.className = o, g.data = j.firstMPT, a.style.cssText = p, g = g.xfirst = f.parse(a, j.difs, g, h)),
				g
			}
		});
		var Eb = function (a) {
			if ((1 === a || 0 === a) && this.data._totalTime === this.data._totalDuration) {
				if ("all" === this.e)
					return this.t.style.cssText = "", void(this.t._gsTransform && delete this.t._gsTransform);
				for (var b, c = this.t.style, d = this.e.split(","), e = d.length, f = h.transform.parse; --e > -1; )
					b = d[e], h[b] && (b = h[b].parse === f ? tb : h[b].p), Cb(c, b)
			}
		};
		for (qb("clearProps", {
				parser : function (a, b, d, e, f) {
					return f = new mb(a, d, 0, 0, f, 2),
					f.setRatio = Eb,
					f.e = b,
					f.pr = -10,
					f.data = e._tween,
					c = !0,
					f
				}
			}), i = "bezier,throwProps,physicsProps,physics2D".split(","), ob = i.length; ob--; )
			rb(i[ob]);
		i = g.prototype,
		i._firstPT = null,
		i._onInitTween = function (a, b, h) {
			if (!a.nodeType)
				return !1;
			this._target = a,
			this._tween = h,
			this._vars = b,
			j = b.autoRound,
			c = !1,
			d = b.suffixMap || g.suffixMap,
			e = U(a, ""),
			f = this._overwriteProps;
			var i,
			m,
			o,
			p,
			q,
			r,
			s,
			t,
			u,
			w = a.style;
			if (k && "" === w.zIndex && (i = V(a, "zIndex", e), ("auto" === i || "" === i) && (w.zIndex = 0)), "string" == typeof b && (p = w.cssText, i = Y(a, e), w.cssText = p + ";" + b, i = Z(a, i, Y(a)).difs, !O && v.test(b) && (i.opacity = parseFloat(RegExp.$1)), b = i, w.cssText = p), this._firstPT = m = this.parse(a, b, null), this._transformType) {
				for (u = 3 === this._transformType, tb ? l && (k = !0, "" === w.zIndex && (s = V(a, "zIndex", e), ("auto" === s || "" === s) && (w.zIndex = 0)), n && (w.WebkitBackfaceVisibility = this._vars.WebkitBackfaceVisibility || (u ? "visible" : "hidden"))) : w.zoom = 1, o = m; o && o._next; )
					o = o._next;
				t = new mb(a, "transform", 0, 0, null, 2),
				this._linkCSSP(t, null, o),
				t.setRatio = u && wb ? zb : tb ? Ab : yb,
				t.data = this._transform || xb(a, e, !0),
				f.pop()
			}
			if (c) {
				for (; m; ) {
					for (r = m._next, o = p; o && o.pr > m.pr; )
						o = o._next;
					(m._prev = o ? o._prev : q) ? m._prev._next = m : p = m,
					(m._next = o) ? o._prev = m : q = m,
					m = r
				}
				this._firstPT = p
			}
			return !0
		},
		i.parse = function (a, b, c, f) {
			var g,
			i,
			k,
			l,
			m,
			n,
			o,
			p,
			q,
			r,
			s = a.style;
			for (g in b)
				n = b[g], i = h[g], i ? c = i.parse(a, n, g, this, c, f, b) : (m = V(a, g, e) + "", q = "string" == typeof n, "color" === g || "fill" === g || "stroke" === g || -1 !== g.indexOf("Color") || q && x.test(n) ? (q || (n = hb(n), n = (n.length > 3 ? "rgba(" : "rgb(") + n.join(",") + ")"), c = nb(s, g, m, n, !0, "transparent", c, 0, f)) : !q || -1 === n.indexOf(" ") && -1 === n.indexOf(",") ? (k = parseFloat(m), o = k || 0 === k ? m.substr((k + "").length) : "", ("" === m || "auto" === m) && ("width" === g || "height" === g ? (k = ab(a, g, e), o = "px") : "left" === g || "top" === g ? (k = X(a, g, e), o = "px") : (k = "opacity" !== g ? 0 : 1, o = "")), r = q && "=" === n.charAt(1), r ? (l = parseInt(n.charAt(0) + "1", 10), n = n.substr(2), l *= parseFloat(n), p = n.replace(t, "")) : (l = parseFloat(n), p = q ? n.substr((l + "").length) || "" : ""), "" === p && (p = d[g] || o), n = l || 0 === l ? (r ? l + k : l) + p : b[g], o !== p && "" !== p && (l || 0 === l) && (k || 0 === k) && (k = W(a, g, k, o), "%" === p ? (k /= W(a, g, 100, "%") / 100, k > 100 && (k = 100), b.strictUnits !== !0 && (m = k + "%")) : "em" === p ? k /= W(a, g, 1, "em") : (l = W(a, g, l, p), p = "px"), r && (l || 0 === l) && (n = l + k + p)), r && (l += k), !k && 0 !== k || !l && 0 !== l ? void 0 !== s[g] && (n || "NaN" != n + "" && null != n) ? (c = new mb(s, g, l || k || 0, 0, c, -1, g, !1, 0, m, n), c.xs0 = "none" !== n || "display" !== g && -1 === g.indexOf("Style") ? n : m) : Q("invalid " + g + " tween value: " + b[g]) : (c = new mb(s, g, k, l - k, c, 0, g, j !== !1 && ("px" === p || "zIndex" === g), 0, m, n), c.xs0 = p)) : c = nb(s, g, m, n, !0, null, c, 0, f)), f && c && !c.plugin && (c.plugin = f);
			return c
		},
		i.setRatio = function (a) {
			var b,
			c,
			d,
			e = this._firstPT,
			f = 1e-6;
			if (1 !== a || this._tween._time !== this._tween._duration && 0 !== this._tween._time)
				if (a || this._tween._time !== this._tween._duration && 0 !== this._tween._time || this._tween._rawPrevTime === -1e-6)
					for (; e; ) {
						if (b = e.c * a + e.s, e.r ? b = b > 0 ? 0 | b + .5 : 0 | b - .5 : f > b && b > -f && (b = 0), e.type)
							if (1 === e.type)
								if (d = e.l, 2 === d)
									e.t[e.p] = e.xs0 + b + e.xs1 + e.xn1 + e.xs2;
								else if (3 === d)
									e.t[e.p] = e.xs0 + b + e.xs1 + e.xn1 + e.xs2 + e.xn2 + e.xs3;
								else if (4 === d)
									e.t[e.p] = e.xs0 + b + e.xs1 + e.xn1 + e.xs2 + e.xn2 + e.xs3 + e.xn3 + e.xs4;
								else if (5 === d)
									e.t[e.p] = e.xs0 + b + e.xs1 + e.xn1 + e.xs2 + e.xn2 + e.xs3 + e.xn3 + e.xs4 + e.xn4 + e.xs5;
								else {
									for (c = e.xs0 + b + e.xs1, d = 1; e.l > d; d++)
										c += e["xn" + d] + e["xs" + (d + 1)];
									e.t[e.p] = c
								}
							else  - 1 === e.type ? e.t[e.p] = e.xs0 : e.setRatio && e.setRatio(a);
						else
							e.t[e.p] = b + e.xs0;
						e = e._next
					}
				else
					for (; e; )
						2 !== e.type ? e.t[e.p] = e.b : e.setRatio(a), e = e._next;
			else
				for (; e; )
					2 !== e.type ? e.t[e.p] = e.e : e.setRatio(a), e = e._next
		},
		i._enableTransforms = function (a) {
			this._transformType = a || 3 === this._transformType ? 3 : 2,
			this._transform = this._transform || xb(this._target, e, !0)
		},
		i._linkCSSP = function (a, b, c, d) {
			return a && (b && (b._prev = a), a._next && (a._next._prev = a._prev), a._prev ? a._prev._next = a._next : this._firstPT === a && (this._firstPT = a._next, d = !0), c ? c._next = a : d || null !== this._firstPT || (this._firstPT = a), a._next = b, a._prev = c),
			a
		},
		i._kill = function (b) {
			var c,
			d,
			e,
			f = b;
			if (b.autoAlpha || b.alpha) {
				f = {};
				for (d in b)
					f[d] = b[d];
				f.opacity = 1,
				f.autoAlpha && (f.visibility = 1)
			}
			return b.className && (c = this._classNamePT) && (e = c.xfirst, e && e._prev ? this._linkCSSP(e._prev, c._next, e._prev._prev) : e === this._firstPT && (this._firstPT = c._next), c._next && this._linkCSSP(c._next, c._next._next, e._prev), this._classNamePT = null),
			a.prototype._kill.call(this, f)
		};
		var Fb = function (a, b, c) {
			var d,
			e,
			f,
			g;
			if (a.slice)
				for (e = a.length; --e > -1; )
					Fb(a[e], b, c);
			else
				for (d = a.childNodes, e = d.length; --e > -1; )
					f = d[e], g = f.type, f.style && (b.push(Y(f)), c && c.push(f)), 1 !== g && 9 !== g && 11 !== g || !f.childNodes.length || Fb(f, b, c)
		};
		return g.cascadeTo = function (a, c, d) {
			var e,
			f,
			g,
			h = b.to(a, c, d),
			i = [h],
			j = [],
			k = [],
			l = [],
			m = b._internals.reservedProps;
			for (a = h._targets || h.target, Fb(a, j, l), h.render(c, !0), Fb(a, k), h.render(0, !0), h._enabled(!0), e = l.length; --e > -1; )
				if (f = Z(l[e], j[e], k[e]), f.firstMPT) {
					f = f.difs;
					for (g in d)
						m[g] && (f[g] = d[g]);
					i.push(b.to(l[e], c, f))
				}
			return i
		},
		a.activate([g]),
		g
	}, !0)
}), window._gsDefine && window._gsQueue.pop()(), (window._gsQueue || (window._gsQueue = [])).push(function () {
	"use strict";
	var a = document.documentElement,
	b = window,
	c = function (c, d) {
		var e = "x" === d ? "Width" : "Height",
		f = "scroll" + e,
		g = "client" + e,
		h = document.body;
		return c === b || c === a || c === h ? Math.max(a[f], h[f]) - (b["inner" + e] || Math.max(a[g], h[g])) : c[f] - c["offset" + e]
	},
	d = window._gsDefine.plugin({
			propName : "scrollTo",
			API : 2,
			init : function (a, d, e) {
				return this._wdw = a === b,
				this._target = a,
				this._tween = e,
				"object" != typeof d && (d = {
						y : d
					}),
				this._autoKill = d.autoKill !== !1,
				this.x = this.xPrev = this.getX(),
				this.y = this.yPrev = this.getY(),
				null != d.x ? this._addTween(this, "x", this.x, "max" === d.x ? c(a, "x") : d.x, "scrollTo_x", !0) : this.skipX = !0,
				null != d.y ? this._addTween(this, "y", this.y, "max" === d.y ? c(a, "y") : d.y, "scrollTo_y", !0) : this.skipY = !0,
				!0
			},
			set : function (a) {
				this._super.setRatio.call(this, a);
				var c = this._wdw || !this.skipX ? this.getX() : this.xPrev,
				d = this._wdw || !this.skipY ? this.getY() : this.yPrev,
				e = d - this.yPrev,
				f = c - this.xPrev;
				this._autoKill && (!this.skipX && (f > 7 || -7 > f) && (this.skipX = !0), !this.skipY && (e > 7 || -7 > e) && (this.skipY = !0), this.skipX && this.skipY && this._tween.kill()),
				this._wdw ? b.scrollTo(this.skipX ? c : this.x, this.skipY ? d : this.y) : (this.skipY || (this._target.scrollTop = this.y), this.skipX || (this._target.scrollLeft = this.x)),
				this.xPrev = this.x,
				this.yPrev = this.y
			}
		}),
	e = d.prototype;
	d.max = c,
	e.getX = function () {
		return this._wdw ? null != b.pageXOffset ? b.pageXOffset : null != a.scrollLeft ? a.scrollLeft : document.body.scrollLeft : this._target.scrollLeft
	},
	e.getY = function () {
		return this._wdw ? null != b.pageYOffset ? b.pageYOffset : null != a.scrollTop ? a.scrollTop : document.body.scrollTop : this._target.scrollTop
	},
	e._kill = function (a) {
		return a.scrollTo_x && (this.skipX = !0),
		a.scrollTo_y && (this.skipY = !0),
		this._super._kill.call(this, a)
	}
}), window._gsDefine && window._gsQueue.pop()(), (window._gsQueue || (window._gsQueue = [])).push(function () {
	"use strict";
	window._gsDefine("easing.Back", ["easing.Ease"], function (a) {
		var b,
		c,
		d,
		e = window.GreenSockGlobals || window,
		f = e.com.greensock,
		g = 2 * Math.PI,
		h = Math.PI / 2,
		i = f._class,
		j = function (b, c) {
			var d = i("easing." + b, function () {}, !0),
			e = d.prototype = new a;
			return e.constructor = d,
			e.getRatio = c,
			d
		},
		k = a.register || function () {},
		l = function (a, b, c, d) {
			var e = i("easing." + a, {
					easeOut : new b,
					easeIn : new c,
					easeInOut : new d
				}, !0);
			return k(e, a),
			e
		},
		m = function (a, b, c) {
			this.t = a,
			this.v = b,
			c && (this.next = c, c.prev = this, this.c = c.v - b, this.gap = c.t - a)
		},
		n = function (b, c) {
			var d = i("easing." + b, function (a) {
					this._p1 = a || 0 === a ? a : 1.70158,
					this._p2 = 1.525 * this._p1
				}, !0),
			e = d.prototype = new a;
			return e.constructor = d,
			e.getRatio = c,
			e.config = function (a) {
				return new d(a)
			},
			d
		},
		o = l("Back", n("BackOut", function (a) {
					return (a -= 1) * a * ((this._p1 + 1) * a + this._p1) + 1
				}), n("BackIn", function (a) {
					return a * a * ((this._p1 + 1) * a - this._p1)
				}), n("BackInOut", function (a) {
					return 1 > (a *= 2) ? .5 * a * a * ((this._p2 + 1) * a - this._p2) : .5 * ((a -= 2) * a * ((this._p2 + 1) * a + this._p2) + 2)
				})),
		p = i("easing.SlowMo", function (a, b, c) {
				b = b || 0 === b ? b : .7,
				null == a ? a = .7 : a > 1 && (a = 1),
				this._p = 1 !== a ? b : 0,
				this._p1 = (1 - a) / 2,
				this._p2 = a,
				this._p3 = this._p1 + this._p2,
				this._calcEnd = c === !0
			}, !0),
		q = p.prototype = new a;
		return q.constructor = p,
		q.getRatio = function (a) {
			var b = a + (.5 - a) * this._p;
			return this._p1 > a ? this._calcEnd ? 1 - (a = 1 - a / this._p1) * a : b - (a = 1 - a / this._p1) * a * a * a * b : a > this._p3 ? this._calcEnd ? 1 - (a = (a - this._p3) / this._p1) * a : b + (a - b) * (a = (a - this._p3) / this._p1) * a * a * a : this._calcEnd ? 1 : b
		},
		p.ease = new p(.7, .7),
		q.config = p.config = function (a, b, c) {
			return new p(a, b, c)
		},
		b = i("easing.SteppedEase", function (a) {
				a = a || 1,
				this._p1 = 1 / a,
				this._p2 = a + 1
			}, !0),
		q = b.prototype = new a,
		q.constructor = b,
		q.getRatio = function (a) {
			return 0 > a ? a = 0 : a >= 1 && (a = .999999999),
			(this._p2 * a >> 0) * this._p1
		},
		q.config = b.config = function (a) {
			return new b(a)
		},
		c = i("easing.RoughEase", function (b) {
				b = b || {};
				for (var c, d, e, f, g, h, i = b.taper || "none", j = [], k = 0, l = 0 | (b.points || 20), n = l, o = b.randomize !== !1, p = b.clamp === !0, q = b.template instanceof a ? b.template : null, r = "number" == typeof b.strength ? .4 * b.strength : .4; --n > -1; )
					c = o ? Math.random() : 1 / l * n, d = q ? q.getRatio(c) : c, "none" === i ? e = r : "out" === i ? (f = 1 - c, e = f * f * r) : "in" === i ? e = c * c * r : .5 > c ? (f = 2 * c, e = .5 * f * f * r) : (f = 2 * (1 - c), e = .5 * f * f * r), o ? d += Math.random() * e - .5 * e : n % 2 ? d += .5 * e : d -= .5 * e, p && (d > 1 ? d = 1 : 0 > d && (d = 0)), j[k++] = {
						x : c,
						y : d
					};
				for (j.sort(function (a, b) {
						return a.x - b.x
					}), h = new m(1, 1, null), n = l; --n > -1; )
					g = j[n], h = new m(g.x, g.y, h);
				this._prev = new m(0, 0, 0 !== h.t ? h : h.next)
			}, !0),
		q = c.prototype = new a,
		q.constructor = c,
		q.getRatio = function (a) {
			var b = this._prev;
			if (a > b.t) {
				for (; b.next && a >= b.t; )
					b = b.next;
				b = b.prev
			} else
				for (; b.prev && b.t >= a; )
					b = b.prev;
			return this._prev = b,
			b.v + (a - b.t) / b.gap * b.c
		},
		q.config = function (a) {
			return new c(a)
		},
		c.ease = new c,
		l("Bounce", j("BounceOut", function (a) {
				return 1 / 2.75 > a ? 7.5625 * a * a : 2 / 2.75 > a ? 7.5625 * (a -= 1.5 / 2.75) * a + .75 : 2.5 / 2.75 > a ? 7.5625 * (a -= 2.25 / 2.75) * a + .9375 : 7.5625 * (a -= 2.625 / 2.75) * a + .984375
			}), j("BounceIn", function (a) {
				return 1 / 2.75 > (a = 1 - a) ? 1 - 7.5625 * a * a : 2 / 2.75 > a ? 1 - (7.5625 * (a -= 1.5 / 2.75) * a + .75) : 2.5 / 2.75 > a ? 1 - (7.5625 * (a -= 2.25 / 2.75) * a + .9375) : 1 - (7.5625 * (a -= 2.625 / 2.75) * a + .984375)
			}), j("BounceInOut", function (a) {
				var b = .5 > a;
				return a = b ? 1 - 2 * a : 2 * a - 1,
				a = 1 / 2.75 > a ? 7.5625 * a * a : 2 / 2.75 > a ? 7.5625 * (a -= 1.5 / 2.75) * a + .75 : 2.5 / 2.75 > a ? 7.5625 * (a -= 2.25 / 2.75) * a + .9375 : 7.5625 * (a -= 2.625 / 2.75) * a + .984375,
				b ? .5 * (1 - a) : .5 * a + .5
			})),
		l("Circ", j("CircOut", function (a) {
				return Math.sqrt(1 - (a -= 1) * a)
			}), j("CircIn", function (a) {
				return  - (Math.sqrt(1 - a * a) - 1)
			}), j("CircInOut", function (a) {
				return 1 > (a *= 2) ?  - .5 * (Math.sqrt(1 - a * a) - 1) : .5 * (Math.sqrt(1 - (a -= 2) * a) + 1)
			})),
		d = function (b, c, d) {
			var e = i("easing." + b, function (a, b) {
					this._p1 = a || 1,
					this._p2 = b || d,
					this._p3 = this._p2 / g * (Math.asin(1 / this._p1) || 0)
				}, !0),
			f = e.prototype = new a;
			return f.constructor = e,
			f.getRatio = c,
			f.config = function (a, b) {
				return new e(a, b)
			},
			e
		},
		l("Elastic", d("ElasticOut", function (a) {
				return this._p1 * Math.pow(2, -10 * a) * Math.sin((a - this._p3) * g / this._p2) + 1
			}, .3), d("ElasticIn", function (a) {
				return  - (this._p1 * Math.pow(2, 10 * (a -= 1)) * Math.sin((a - this._p3) * g / this._p2))
			}, .3), d("ElasticInOut", function (a) {
				return 1 > (a *= 2) ?  - .5 * this._p1 * Math.pow(2, 10 * (a -= 1)) * Math.sin((a - this._p3) * g / this._p2) : .5 * this._p1 * Math.pow(2, -10 * (a -= 1)) * Math.sin((a - this._p3) * g / this._p2) + 1
			}, .45)),
		l("Expo", j("ExpoOut", function (a) {
				return 1 - Math.pow(2, -10 * a)
			}), j("ExpoIn", function (a) {
				return Math.pow(2, 10 * (a - 1)) - .001
			}), j("ExpoInOut", function (a) {
				return 1 > (a *= 2) ? .5 * Math.pow(2, 10 * (a - 1)) : .5 * (2 - Math.pow(2, -10 * (a - 1)))
			})),
		l("Sine", j("SineOut", function (a) {
				return Math.sin(a * h)
			}), j("SineIn", function (a) {
				return -Math.cos(a * h) + 1
			}), j("SineInOut", function (a) {
				return  - .5 * (Math.cos(Math.PI * a) - 1)
			})),
		i("easing.EaseLookup", {
			find : function (b) {
				return a.map[b]
			}
		}, !0),
		k(e.SlowMo, "SlowMo", "ease,"),
		k(c, "RoughEase", "ease,"),
		k(b, "SteppedEase", "ease,"),
		o
	}, !0)
}), window._gsDefine && window._gsQueue.pop()(), function (a, b) {
	function c(a) {
		function b() {
			return i = l(a)
		}
		function c() {
			setTimeout(function () {
				var c = i,
				d = b();
				c !== d && a.__placeholder && (a.value = d),
				a.__placeholder && a.value !== d && (a.__placeholder = !1)
			}, 0)
		}
		function d() {
			a.value ? h() : e()
		}
		function e() {
			a.__placeholder || a.value || g()
		}
		function g() {
			a.__placeholder = !0,
			a.value = b(),
			j(a, "-placeholder")
		}
		function h() {
			a.__placeholder && (a.__placeholder = !1, a.value = "", k(a, "-placeholder"))
		}
		if (null != a.__placeholder)
			return void(a.__placeholder && (a.value = b()));
		var i = l(a);
		a.value ? (a.__placeholder = !1, a.value === b() && g()) : e(),
		f(a, "keyup", d),
		f(a, "keyDown", d),
		f(a, "blur", d),
		f(a, "focus", h),
		f(a, "click", h),
		a.addEventListener ? f(a, "DOMAttrModified", c) : a.attachEvent && "onpropertychange" in a && f(a, "propertychange", c)
	}
	function d() {
		var a = [];
		return g(arguments, function (b) {
			"number" != typeof b.length && (b = [b]),
			a.push.apply(a, h(b, e))
		}),
		a
	}
	function e(a) {
		var b = (a.nodeName || "").toLowerCase();
		return "textarea" === b || "input" === b && ("text" === a.type || "password" === a.type)
	}
	function f(a, b, c) {
		a.addEventListener ? a.addEventListener(b, c, !1) : a.attachEvent && a.attachEvent("on" + b, c)
	}
	function g(a, b) {
		if (a.forEach)
			return a.forEach(b);
		for (var c = 0, d = a.length; d > c; c++)
			b.call(null, a[c], c, a)
	}
	function h(a, b) {
		if (a.filter)
			return a.filter(b);
		for (var c = [], d = 0, e = a.length; e > d; d++)
			b.call(null, a[d], d, a) && c.push(a[d]);
		return c
	}
	function i(a) {
		return p[a] || (p[a] = new RegExp("(^|\\s)+" + a + "(\\s|$)+", "g")),
		p[a]
	}
	function j(a, b) {
		a.className += " " + b
	}
	function k(a, b) {
		a.className = a.className.replace(i(b), " ")
	}
	function l(a) {
		return a.getAttribute("placeholder") || a.attributes.placeholder && a.attributes.placeholder.nodeValue
	}
	function m() {
		var a = b.styleSheets && b.styleSheets[0];
		if (!a) {
			var c = (b.head || b.getElementsByTagName("head")[0], b.createElement("style"));
			c.appendChild(b.createTextNode("")),
			b.head.appendChild(c),
			a = c.sheet
		}
		return a
	}
	if ("placeholder" in b.createElement("input"))
		return b.placeholderPolyfill = function () {},
	void(b.placeholderPolyfill.active = !1);
	var n = b.getElementsByTagName("input"),
	o = b.getElementsByTagName("textarea");
	b.placeholderPolyfill = function (a) {
		a = a ? d(a) : d(n, o),
		g(a, c)
	},
	b.placeholderPolyfill.active = !0,
	b.placeholderPolyfill(),
	b.addEventListener ? (b.addEventListener("DOMAttrModified", b.placeholderPolyfill), b.addEventListener("DOMNodeInserted", b.placeholderPolyfill)) : b.attachEvent && "onpropertychange" in b && b.attachEvent("onpropertychange", b.placeholderPolyfill),
	m().addRule(".-placeholder", "color: #888;", 0);
	var p = {}

}
(window, document), Array.prototype.indexOf || (Array.prototype.indexOf = function (a, b) {
	var c,
	d,
	e = b ? b : 0;
	if (!this)
		throw new TypeError;
	if (d = this.length, 0 === d || e >= d)
		return -1;
	for (0 > e && (e = d - Math.abs(e)), c = e; d > c; c++)
		if (this[c] === a)
			return c;
	return -1
}), function () {
	var a = this,
	b = a._,
	c = {},
	d = Array.prototype,
	e = Object.prototype,
	f = Function.prototype,
	g = d.push,
	h = d.slice,
	i = d.concat,
	j = e.toString,
	k = e.hasOwnProperty,
	l = d.forEach,
	m = d.map,
	n = d.reduce,
	o = d.reduceRight,
	p = d.filter,
	q = d.every,
	r = d.some,
	s = d.indexOf,
	t = d.lastIndexOf,
	u = Array.isArray,
	v = Object.keys,
	w = f.bind,
	x = function (a) {
		return a instanceof x ? a : this instanceof x ? void(this._wrapped = a) : new x(a)
	};
	"undefined" != typeof exports ? ("undefined" != typeof module && module.exports && (exports = module.exports = x), exports._ = x) : a._ = x,
	x.VERSION = "1.5.2";
	var y = x.each = x.forEach = function (a, b, d) {
		if (null != a)
			if (l && a.forEach === l)
				a.forEach(b, d);
			else if (a.length === +a.length) {
				for (var e = 0, f = a.length; f > e; e++)
					if (b.call(d, a[e], e, a) === c)
						return
			} else
				for (var g = x.keys(a), e = 0, f = g.length; f > e; e++)
					if (b.call(d, a[g[e]], g[e], a) === c)
						return
	};
	x.map = x.collect = function (a, b, c) {
		var d = [];
		return null == a ? d : m && a.map === m ? a.map(b, c) : (y(a, function (a, e, f) {
				d.push(b.call(c, a, e, f))
			}), d)
	};
	var z = "Reduce of empty array with no initial value";
	x.reduce = x.foldl = x.inject = function (a, b, c, d) {
		var e = arguments.length > 2;
		if (null == a && (a = []), n && a.reduce === n)
			return d && (b = x.bind(b, d)), e ? a.reduce(b, c) : a.reduce(b);
		if (y(a, function (a, f, g) {
				e ? c = b.call(d, c, a, f, g) : (c = a, e = !0)
			}), !e)
			throw new TypeError(z);
		return c
	},
	x.reduceRight = x.foldr = function (a, b, c, d) {
		var e = arguments.length > 2;
		if (null == a && (a = []), o && a.reduceRight === o)
			return d && (b = x.bind(b, d)), e ? a.reduceRight(b, c) : a.reduceRight(b);
		var f = a.length;
		if (f !== +f) {
			var g = x.keys(a);
			f = g.length
		}
		if (y(a, function (h, i, j) {
				i = g ? g[--f] : --f,
				e ? c = b.call(d, c, a[i], i, j) : (c = a[i], e = !0)
			}), !e)
			throw new TypeError(z);
		return c
	},
	x.find = x.detect = function (a, b, c) {
		var d;
		return A(a, function (a, e, f) {
			return b.call(c, a, e, f) ? (d = a, !0) : void 0
		}),
		d
	},
	x.filter = x.select = function (a, b, c) {
		var d = [];
		return null == a ? d : p && a.filter === p ? a.filter(b, c) : (y(a, function (a, e, f) {
				b.call(c, a, e, f) && d.push(a)
			}), d)
	},
	x.reject = function (a, b, c) {
		return x.filter(a, function (a, d, e) {
			return !b.call(c, a, d, e)
		}, c)
	},
	x.every = x.all = function (a, b, d) {
		b || (b = x.identity);
		var e = !0;
		return null == a ? e : q && a.every === q ? a.every(b, d) : (y(a, function (a, f, g) {
				return (e = e && b.call(d, a, f, g)) ? void 0 : c
			}), !!e)
	};
	var A = x.some = x.any = function (a, b, d) {
		b || (b = x.identity);
		var e = !1;
		return null == a ? e : r && a.some === r ? a.some(b, d) : (y(a, function (a, f, g) {
				return e || (e = b.call(d, a, f, g)) ? c : void 0
			}), !!e)
	};
	x.contains = x.include = function (a, b) {
		return null == a ? !1 : s && a.indexOf === s ? -1 != a.indexOf(b) : A(a, function (a) {
			return a === b
		})
	},
	x.invoke = function (a, b) {
		var c = h.call(arguments, 2),
		d = x.isFunction(b);
		return x.map(a, function (a) {
			return (d ? b : a[b]).apply(a, c)
		})
	},
	x.pluck = function (a, b) {
		return x.map(a, function (a) {
			return a[b]
		})
	},
	x.where = function (a, b, c) {
		return x.isEmpty(b) ? c ? void 0 : [] : x[c ? "find" : "filter"](a, function (a) {
			for (var c in b)
				if (b[c] !== a[c])
					return !1;
			return !0
		})
	},
	x.findWhere = function (a, b) {
		return x.where(a, b, !0)
	},
	x.max = function (a, b, c) {
		if (!b && x.isArray(a) && a[0] === +a[0] && a.length < 65535)
			return Math.max.apply(Math, a);
		if (!b && x.isEmpty(a))
			return -1 / 0;
		var d = {
			computed : -1 / 0,
			value : -1 / 0
		};
		return y(a, function (a, e, f) {
			var g = b ? b.call(c, a, e, f) : a;
			g > d.computed && (d = {
					value : a,
					computed : g
				})
		}),
		d.value
	},
	x.min = function (a, b, c) {
		if (!b && x.isArray(a) && a[0] === +a[0] && a.length < 65535)
			return Math.min.apply(Math, a);
		if (!b && x.isEmpty(a))
			return 1 / 0;
		var d = {
			computed : 1 / 0,
			value : 1 / 0
		};
		return y(a, function (a, e, f) {
			var g = b ? b.call(c, a, e, f) : a;
			g < d.computed && (d = {
					value : a,
					computed : g
				})
		}),
		d.value
	},
	x.shuffle = function (a) {
		var b,
		c = 0,
		d = [];
		return y(a, function (a) {
			b = x.random(c++),
			d[c - 1] = d[b],
			d[b] = a
		}),
		d
	},
	x.sample = function (a, b, c) {
		return arguments.length < 2 || c ? a[x.random(a.length - 1)] : x.shuffle(a).slice(0, Math.max(0, b))
	};
	var B = function (a) {
		return x.isFunction(a) ? a : function (b) {
			return b[a]
		}
	};
	x.sortBy = function (a, b, c) {
		var d = B(b);
		return x.pluck(x.map(a, function (a, b, e) {
				return {
					value : a,
					index : b,
					criteria : d.call(c, a, b, e)
				}
			}).sort(function (a, b) {
				var c = a.criteria,
				d = b.criteria;
				if (c !== d) {
					if (c > d || void 0 === c)
						return 1;
					if (d > c || void 0 === d)
						return -1
				}
				return a.index - b.index
			}), "value")
	};
	var C = function (a) {
		return function (b, c, d) {
			var e = {},
			f = null == c ? x.identity : B(c);
			return y(b, function (c, g) {
				var h = f.call(d, c, g, b);
				a(e, h, c)
			}),
			e
		}
	};
	x.groupBy = C(function (a, b, c) {
			(x.has(a, b) ? a[b] : a[b] = []).push(c)
		}),
	x.indexBy = C(function (a, b, c) {
			a[b] = c
		}),
	x.countBy = C(function (a, b) {
			x.has(a, b) ? a[b]++ : a[b] = 1
		}),
	x.sortedIndex = function (a, b, c, d) {
		c = null == c ? x.identity : B(c);
		for (var e = c.call(d, b), f = 0, g = a.length; g > f; ) {
			var h = f + g >>> 1;
			c.call(d, a[h]) < e ? f = h + 1 : g = h
		}
		return f
	},
	x.toArray = function (a) {
		return a ? x.isArray(a) ? h.call(a) : a.length === +a.length ? x.map(a, x.identity) : x.values(a) : []
	},
	x.size = function (a) {
		return null == a ? 0 : a.length === +a.length ? a.length : x.keys(a).length
	},
	x.first = x.head = x.take = function (a, b, c) {
		return null == a ? void 0 : null == b || c ? a[0] : h.call(a, 0, b)
	},
	x.initial = function (a, b, c) {
		return h.call(a, 0, a.length - (null == b || c ? 1 : b))
	},
	x.last = function (a, b, c) {
		return null == a ? void 0 : null == b || c ? a[a.length - 1] : h.call(a, Math.max(a.length - b, 0))
	},
	x.rest = x.tail = x.drop = function (a, b, c) {
		return h.call(a, null == b || c ? 1 : b)
	},
	x.compact = function (a) {
		return x.filter(a, x.identity)
	};
	var D = function (a, b, c) {
		return b && x.every(a, x.isArray) ? i.apply(c, a) : (y(a, function (a) {
				x.isArray(a) || x.isArguments(a) ? b ? g.apply(c, a) : D(a, b, c) : c.push(a)
			}), c)
	};
	x.flatten = function (a, b) {
		return D(a, b, [])
	},
	x.without = function (a) {
		return x.difference(a, h.call(arguments, 1))
	},
	x.uniq = x.unique = function (a, b, c, d) {
		x.isFunction(b) && (d = c, c = b, b = !1);
		var e = c ? x.map(a, c, d) : a,
		f = [],
		g = [];
		return y(e, function (c, d) {
			(b ? d && g[g.length - 1] === c : x.contains(g, c)) || (g.push(c), f.push(a[d]))
		}),
		f
	},
	x.union = function () {
		return x.uniq(x.flatten(arguments, !0))
	},
	x.intersection = function (a) {
		var b = h.call(arguments, 1);
		return x.filter(x.uniq(a), function (a) {
			return x.every(b, function (b) {
				return x.indexOf(b, a) >= 0
			})
		})
	},
	x.difference = function (a) {
		var b = i.apply(d, h.call(arguments, 1));
		return x.filter(a, function (a) {
			return !x.contains(b, a)
		})
	},
	x.zip = function () {
		for (var a = x.max(x.pluck(arguments, "length").concat(0)), b = new Array(a), c = 0; a > c; c++)
			b[c] = x.pluck(arguments, "" + c);
		return b
	},
	x.object = function (a, b) {
		if (null == a)
			return {};
		for (var c = {}, d = 0, e = a.length; e > d; d++)
			b ? c[a[d]] = b[d] : c[a[d][0]] = a[d][1];
		return c
	},
	x.indexOf = function (a, b, c) {
		if (null == a)
			return -1;
		var d = 0,
		e = a.length;
		if (c) {
			if ("number" != typeof c)
				return d = x.sortedIndex(a, b), a[d] === b ? d : -1;
			d = 0 > c ? Math.max(0, e + c) : c
		}
		if (s && a.indexOf === s)
			return a.indexOf(b, c);
		for (; e > d; d++)
			if (a[d] === b)
				return d;
		return -1
	},
	x.lastIndexOf = function (a, b, c) {
		if (null == a)
			return -1;
		var d = null != c;
		if (t && a.lastIndexOf === t)
			return d ? a.lastIndexOf(b, c) : a.lastIndexOf(b);
		for (var e = d ? c : a.length; e--; )
			if (a[e] === b)
				return e;
		return -1
	},
	x.range = function (a, b, c) {
		arguments.length <= 1 && (b = a || 0, a = 0),
		c = arguments[2] || 1;
		for (var d = Math.max(Math.ceil((b - a) / c), 0), e = 0, f = new Array(d); d > e; )
			f[e++] = a, a += c;
		return f
	};
	var E = function () {};
	x.bind = function (a, b) {
		var c,
		d;
		if (w && a.bind === w)
			return w.apply(a, h.call(arguments, 1));
		if (!x.isFunction(a))
			throw new TypeError;
		return c = h.call(arguments, 2),
		d = function () {
			if (!(this instanceof d))
				return a.apply(b, c.concat(h.call(arguments)));
			E.prototype = a.prototype;
			var e = new E;
			E.prototype = null;
			var f = a.apply(e, c.concat(h.call(arguments)));
			return Object(f) === f ? f : e
		}
	},
	x.partial = function (a) {
		var b = h.call(arguments, 1);
		return function () {
			return a.apply(this, b.concat(h.call(arguments)))
		}
	},
	x.bindAll = function (a) {
		var b = h.call(arguments, 1);
		if (0 === b.length)
			throw new Error("bindAll must be passed function names");
		return y(b, function (b) {
			a[b] = x.bind(a[b], a)
		}),
		a
	},
	x.memoize = function (a, b) {
		var c = {};
		return b || (b = x.identity),
		function () {
			var d = b.apply(this, arguments);
			return x.has(c, d) ? c[d] : c[d] = a.apply(this, arguments)
		}
	},
	x.delay = function (a, b) {
		var c = h.call(arguments, 2);
		return setTimeout(function () {
			return a.apply(null, c)
		}, b)
	},
	x.defer = function (a) {
		return x.delay.apply(x, [a, 1].concat(h.call(arguments, 1)))
	},
	x.throttle = function (a, b, c) {
		var d,
		e,
		f,
		g = null,
		h = 0;
		c || (c = {});
		var i = function () {
			h = c.leading === !1 ? 0 : new Date,
			g = null,
			f = a.apply(d, e)
		};
		return function () {
			var j = new Date;
			h || c.leading !== !1 || (h = j);
			var k = b - (j - h);
			return d = this,
			e = arguments,
			0 >= k ? (clearTimeout(g), g = null, h = j, f = a.apply(d, e)) : g || c.trailing === !1 || (g = setTimeout(i, k)),
			f
		}
	},
	x.debounce = function (a, b, c) {
		var d,
		e,
		f,
		g,
		h;
		return function () {
			f = this,
			e = arguments,
			g = new Date;
			var i = function () {
				var j = new Date - g;
				b > j ? d = setTimeout(i, b - j) : (d = null, c || (h = a.apply(f, e)))
			},
			j = c && !d;
			return d || (d = setTimeout(i, b)),
			j && (h = a.apply(f, e)),
			h
		}
	},
	x.once = function (a) {
		var b,
		c = !1;
		return function () {
			return c ? b : (c = !0, b = a.apply(this, arguments), a = null, b)
		}
	},
	x.wrap = function (a, b) {
		return function () {
			var c = [a];
			return g.apply(c, arguments),
			b.apply(this, c)
		}
	},
	x.compose = function () {
		var a = arguments;
		return function () {
			for (var b = arguments, c = a.length - 1; c >= 0; c--)
				b = [a[c].apply(this, b)];
			return b[0]
		}
	},
	x.after = function (a, b) {
		return function () {
			return --a < 1 ? b.apply(this, arguments) : void 0
		}
	},
	x.keys = v || function (a) {
		if (a !== Object(a))
			throw new TypeError("Invalid object");
		var b = [];
		for (var c in a)
			x.has(a, c) && b.push(c);
		return b
	},
	x.values = function (a) {
		for (var b = x.keys(a), c = b.length, d = new Array(c), e = 0; c > e; e++)
			d[e] = a[b[e]];
		return d
	},
	x.pairs = function (a) {
		for (var b = x.keys(a), c = b.length, d = new Array(c), e = 0; c > e; e++)
			d[e] = [b[e], a[b[e]]];
		return d
	},
	x.invert = function (a) {
		for (var b = {}, c = x.keys(a), d = 0, e = c.length; e > d; d++)
			b[a[c[d]]] = c[d];
		return b
	},
	x.functions = x.methods = function (a) {
		var b = [];
		for (var c in a)
			x.isFunction(a[c]) && b.push(c);
		return b.sort()
	},
	x.extend = function (a) {
		return y(h.call(arguments, 1), function (b) {
			if (b)
				for (var c in b)
					a[c] = b[c]
		}),
		a
	},
	x.pick = function (a) {
		var b = {},
		c = i.apply(d, h.call(arguments, 1));
		return y(c, function (c) {
			c in a && (b[c] = a[c])
		}),
		b
	},
	x.omit = function (a) {
		var b = {},
		c = i.apply(d, h.call(arguments, 1));
		for (var e in a)
			x.contains(c, e) || (b[e] = a[e]);
		return b
	},
	x.defaults = function (a) {
		return y(h.call(arguments, 1), function (b) {
			if (b)
				for (var c in b)
					void 0 === a[c] && (a[c] = b[c])
		}),
		a
	},
	x.clone = function (a) {
		return x.isObject(a) ? x.isArray(a) ? a.slice() : x.extend({}, a) : a
	},
	x.tap = function (a, b) {
		return b(a),
		a
	};
	var F = function (a, b, c, d) {
		if (a === b)
			return 0 !== a || 1 / a == 1 / b;
		if (null == a || null == b)
			return a === b;
		a instanceof x && (a = a._wrapped),
		b instanceof x && (b = b._wrapped);
		var e = j.call(a);
		if (e != j.call(b))
			return !1;
		switch (e) {
		case "[object String]":
			return a == String(b);
		case "[object Number]":
			return a != +a ? b != +b : 0 == a ? 1 / a == 1 / b : a == +b;
		case "[object Date]":
		case "[object Boolean]":
			return +a == +b;
		case "[object RegExp]":
			return a.source == b.source && a.global == b.global && a.multiline == b.multiline && a.ignoreCase == b.ignoreCase
		}
		if ("object" != typeof a || "object" != typeof b)
			return !1;
		for (var f = c.length; f--; )
			if (c[f] == a)
				return d[f] == b;
		var g = a.constructor,
		h = b.constructor;
		if (g !== h && !(x.isFunction(g) && g instanceof g && x.isFunction(h) && h instanceof h))
			return !1;
		c.push(a),
		d.push(b);
		var i = 0,
		k = !0;
		if ("[object Array]" == e) {
			if (i = a.length, k = i == b.length)
				for (; i-- && (k = F(a[i], b[i], c, d)); );
		} else {
			for (var l in a)
				if (x.has(a, l) && (i++, !(k = x.has(b, l) && F(a[l], b[l], c, d))))
					break;
			if (k) {
				for (l in b)
					if (x.has(b, l) && !i--)
						break;
				k = !i
			}
		}
		return c.pop(),
		d.pop(),
		k
	};
	x.isEqual = function (a, b) {
		return F(a, b, [], [])
	},
	x.isEmpty = function (a) {
		if (null == a)
			return !0;
		if (x.isArray(a) || x.isString(a))
			return 0 === a.length;
		for (var b in a)
			if (x.has(a, b))
				return !1;
		return !0
	},
	x.isElement = function (a) {
		return !(!a || 1 !== a.nodeType)
	},
	x.isArray = u || function (a) {
		return "[object Array]" == j.call(a)
	},
	x.isObject = function (a) {
		return a === Object(a)
	},
	y(["Arguments", "Function", "String", "Number", "Date", "RegExp"], function (a) {
		x["is" + a] = function (b) {
			return j.call(b) == "[object " + a + "]"
		}
	}),
	x.isArguments(arguments) || (x.isArguments = function (a) {
		return !(!a || !x.has(a, "callee"))
	}),
	"function" != typeof / . /  && (x.isFunction = function (a) {
		return "function" == typeof a
	}),
	x.isFinite = function (a) {
		return isFinite(a) && !isNaN(parseFloat(a))
	},
	x.isNaN = function (a) {
		return x.isNumber(a) && a != +a
	},
	x.isBoolean = function (a) {
		return a === !0 || a === !1 || "[object Boolean]" == j.call(a)
	},
	x.isNull = function (a) {
		return null === a
	},
	x.isUndefined = function (a) {
		return void 0 === a
	},
	x.has = function (a, b) {
		return k.call(a, b)
	},
	x.noConflict = function () {
		return a._ = b,
		this
	},
	x.identity = function (a) {
		return a
	},
	x.times = function (a, b, c) {
		for (var d = Array(Math.max(0, a)), e = 0; a > e; e++)
			d[e] = b.call(c, e);
		return d
	},
	x.random = function (a, b) {
		return null == b && (b = a, a = 0),
		a + Math.floor(Math.random() * (b - a + 1))
	};
	var G = {
		escape : {
			"&" : "&amp;",
			"<" : "&lt;",
			">" : "&gt;",
			'"' : "&quot;",
			"'" : "&#x27;"
		}
	};
	G.unescape = x.invert(G.escape);
	var H = {
		escape : new RegExp("[" + x.keys(G.escape).join("") + "]", "g"),
		unescape : new RegExp("(" + x.keys(G.unescape).join("|") + ")", "g")
	};
	x.each(["escape", "unescape"], function (a) {
		x[a] = function (b) {
			return null == b ? "" : ("" + b).replace(H[a], function (b) {
				return G[a][b]
			})
		}
	}),
	x.result = function (a, b) {
		if (null == a)
			return void 0;
		var c = a[b];
		return x.isFunction(c) ? c.call(a) : c
	},
	x.mixin = function (a) {
		y(x.functions(a), function (b) {
			var c = x[b] = a[b];
			x.prototype[b] = function () {
				var a = [this._wrapped];
				return g.apply(a, arguments),
				M.call(this, c.apply(x, a))
			}
		})
	};
	var I = 0;
	x.uniqueId = function (a) {
		var b = ++I + "";
		return a ? a + b : b
	},
	x.templateSettings = {
		evaluate : /<%([\s\S]+?)%>/g,
		interpolate : /<%=([\s\S]+?)%>/g,
		escape : /<%-([\s\S]+?)%>/g
	};
	var J = /(.)^/,
	K = {
		"'" : "'",
		"\\" : "\\",
		"\r" : "r",
		"\n" : "n",
		"   " : "t",
		"\u2028" : "u2028",
		"\u2029" : "u2029"
	},
	L = /\\|'|\r|\n|\t|\u2028|\u2029/g;
	x.template = function (a, b, c) {
		var d;
		c = x.defaults({}, c, x.templateSettings);
		var e = new RegExp([(c.escape || J).source, (c.interpolate || J).source, (c.evaluate || J).source].join("|") + "|$", "g"),
		f = 0,
		g = "__p+='";
		a.replace(e, function (b, c, d, e, h) {
			return g += a.slice(f, h).replace(L, function (a) {
				return "\\" + K[a]
			}),
			c && (g += "'+\n((__t=(" + c + "))==null?'':_.escape(__t))+\n'"),
			d && (g += "'+\n((__t=(" + d + "))==null?'':__t)+\n'"),
			e && (g += "';\n" + e + "\n__p+='"),
			f = h + b.length,
			b
		}),
		g += "';\n",
		c.variable || (g = "with(obj||{}){\n" + g + "}\n"),
		g = "var __t,__p='',__j=Array.prototype.join,print=function(){__p+=__j.call(arguments,'');};\n" + g + "return __p;\n";
		try {
			d = new Function(c.variable || "obj", "_", g)
		} catch (h) {
			throw h.source = g,
			h
		}
		if (b)
			return d(b, x);
		var i = function (a) {
			return d.call(this, a, x)
		};
		return i.source = "function(" + (c.variable || "obj") + "){\n" + g + "}",
		i
	},
	x.chain = function (a) {
		return x(a).chain()
	};
	var M = function (a) {
		return this._chain ? x(a).chain() : a
	};
	x.mixin(x),
	y(["pop", "push", "reverse", "shift", "sort", "splice", "unshift"], function (a) {
		var b = d[a];
		x.prototype[a] = function () {
			var c = this._wrapped;
			return b.apply(c, arguments),
			"shift" != a && "splice" != a || 0 !== c.length || delete c[0],
			M.call(this, c)
		}
	}),
	y(["concat", "join", "slice"], function (a) {
		var b = d[a];
		x.prototype[a] = function () {
			return M.call(this, b.apply(this._wrapped, arguments))
		}
	}),
	x.extend(x.prototype, {
		chain : function () {
			return this._chain = !0,
			this
		},
		value : function () {
			return this._wrapped
		}
	})
}
.call(this);
var initializing = !1, fnTest = /xyz/.test(function () {}) ? /\b_super\b/ : /.*/;
this.Class = function () {}, Class.extend = function (a) {
	function b() {
		!initializing && this.init && this.init.apply(this, arguments)
	}
	var c = this.prototype;
	initializing = !0;
	var d = new this;
	initializing = !1;
	for (var e in a)
		d[e] = "function" == typeof a[e] && "function" == typeof c[e] && fnTest.test(a[e]) ? function (a, b) {
			return function () {
				var d = this._super;
				this._super = c[a];
				var e = b.apply(this, arguments);
				return this._super = d,
				e
			}
		}
	(e, a[e]) : a[e];
	return b.prototype = d,
	b.prototype.constructor = b,
	b.extend = arguments.callee,
	b
}, function (a) {
	"use strict";
	a.Abstract = Class.extend({
			defaults : {},
			init : function (a, b) {
				_.isUndefined(b) && (b = {}),
				this.options = _.defaults(b, this.defaults),
				this.parent = a
			},
			type : function (a) {
				if (null === a)
					return "null";
				if (a && (1 === a.nodeType || 9 === a.nodeType))
					return "element";
				var b = Object.prototype.toString.call(a),
				c = b.match(/\[object (.*?)\]/)[1].toLowerCase();
				if ("number" === c) {
					if (isNaN(a))
						return "nan";
					if (!isFinite(a))
						return "infinity"
				}
				return c
			},
			init_callbacks : function () {
				_.isUndefined(this.callbacks_initialized) && (this.callbacks_initialized = !0, this.callbacks_names = [], this.callbacks_actions = [])
			},
			on : function (a, b) {
				this.init_callbacks();
				var c = this,
				d = a.split(" "),
				e = !1;
				return _.isUndefined(b) ? !1 : (_.each(d, function (a) {
						var d = _.indexOf(c.callbacks_names, a);
						a = c.clean_callback_name(a),
						-1 == d ? (c.callbacks_names.push(a), c.callbacks_actions.push([b])) : c.callbacks_actions[d].push(b),
						e = !0
					}), e)
			},
			off : function () {
				this.init_callbacks()
			},
			trigger : function (a, b) {
				this.init_callbacks();
				var c = _.indexOf(this.callbacks_names, a),
				d = !1;
				return _.isUndefined(b) && (b = []),
				-1 === c ? d : (_.each(this.callbacks_actions[c], function (a) {
						a.apply(this, b)
					}), d = !0)
			},
			clean_callback_name : function (a) {
				return a = a.toLowerCase(),
				a = a.replace("-", "_")
			},
			destroy : function () {}

		})
}
(window), function (a) {
	"use strict";
	a.Images = Abstract.extend({
			init : function (a, b) {
				this._super(a, b),
				this.urls = [],
				this.images = [],
				this.length = 0,
				this.loaded = 0
			},
			load : function (a, b) {
				var c = this;
				"string" == typeof a ? this.urls.push(a) : a instanceof Array && (this.urls = a),
				this.images = [],
				this.length = this.urls.length,
				this.loaded = 0;
				for (var d = 0; d < this.length; d++)
					!function () {
						var a = new Image;
						c.images.push(a),
						a.onload = function () {
							c.loaded++,
							c.loaded === c.length && b.call(c, c.images)
						},
						a.src = c.urls[d]
					}
				()
			},
			add : function (a) {
				"string" == typeof a ? this.urls.push(a) : a instanceof Array && (this.urls = a)
			},
			get_proportions : function (a, b, c, d, e, f, g, h, i) {
				var j = {},
				k = a / b,
				l = c / d,
				m = 0,
				n = 0,
				o = 0,
				p = 0;
				if ((void 0 === typeof f || "left" !== f && "center" !== f && "right" !== f) && (f = "center"), (void 0 === typeof g || "top" !== g && "middle" !== g && "bottom" !== g) && (g = "middle"), "undefined" == typeof e || "fill" === e || "full" === e)
					if (l > k)
						switch (m = c, n = c / a * b, o = 0, g) {
						case "top":
							p = 0;
							break;
						case "middle":
							p = (d - n) / 2;
							break;
						case "bottom":
							p = d - n
						}
					else
						switch (n = d, m = d / b * a, p = 0, f) {
						case "left":
							o = 0;
							break;
						case "center":
							o = (c - m) / 2;
							break;
						case "right":
							o = c - m
						}
				else
					"fit" === e && console.log("fit");
				return ("ceil" === h || "round" === h || "ceil" === h) && (n = this.apply_rounding(n, h), m = this.apply_rounding(m, h), o = this.apply_rounding(o, h), p = this.apply_rounding(p, h)),
				"cartesian" === i ? (j.width = m, j.height = n, j.x = o, j.y = p) : (j.width = m, j.height = n, j.left = o, j.top = p),
				j
			},
			apply_rounding : function (a, b) {
				if ("undefined" == typeof a || "undefined" == typeof b)
					return a;
				switch (b) {
				case "ceil":
					return Math.ceil(a);
				case "floor":
					return Math.floor(a);
				default:
					return Math.round(a)
				}
			}
		})
}
(window), function (a) {
	"use strict";
	a.Browser = Abstract.extend({
			defaults : {
				disable_hover_on_scroll : !1,
				disable_hover_on_scroll_duration : 300
			},
			init : function (a, b) {
				this._super(a, b),
				this.top = 0,
				this.left = 0,
				this.width = 0,
				this.height = 0,
				this.direction = {},
				this.direction.x = null,
				this.direction.y = null,
				this.mouse = {},
				this.mouse.x = 0,
				this.mouse.y = 0,
				this.mouse.ratio_x = 0,
				this.mouse.ratio_y = 0,
				this.is = this.browser_detection(),
				this.version = this.browser_version(),
				this.add_browser_to_body(),
				this.init_events(),
				this.options.disable_hover_on_scroll && this.disable_hover_on_scroll()
			},
			disable_hover_on_scroll : function () {
				var b = this,
				c = $("body");
				this.body = document.body,
				this.timer = null,
				a.addEventListener ? a.addEventListener("scroll", function () {
					clearTimeout(b.timer),
					c.hasClass("disable-hover") || c.addClass("disable-hover"),
					b.timer = setTimeout(function () {
							c.removeClass("disable-hover")
						}, b.options.disable_hover_on_scroll_duration)
				}, !1) : a.attachEvent("scroll", function () {
					clearTimeout(b.timer),
					c.hasClass("disable-hover") || c.addClass("disable-hover"),
					b.timer = setTimeout(function () {
							c.removeClass("disable-hover")
						}, b.options.disable_hover_on_scroll_duration)
				}, !1)
			},
			browser_detection : function () {
				var b = {},
				c = navigator.userAgent.toLowerCase();
				return b.opera = !!a.opera || navigator.userAgent.indexOf(" OPR/") >= 0,
				b.firefox = "undefined" != typeof InstallTrigger,
				b.safari = Object.prototype.toString.call(a.HTMLElement).indexOf("Constructor") > 0,
				b.chrome = !!a.chrome && !b.opera,
				b.internet_explorer = -1 != c.indexOf("msie") && -1 == c.indexOf("opera"),
				b.O = b.opera,
				b.FF = b.firefox,
				b.SAF = b.safari,
				b.CH = b.chrome,
				b.IE = b.internet_explorer,
				b.MSIE = b.internet_explorer,
				b
			},
			browser_version : function () {
				if (this.is.IE) {
					var a = navigator.userAgent.toLowerCase();
					return -1 != a.indexOf("msie") ? parseInt(a.split("msie")[1], 10) : !1
				}
				return !1
			},
			add_browser_to_body : function () {
				var a = $("html");
				for (var b in this.is)
					this.is[b] && a.addClass(b)
			},
			init_events : function () {
				var b = this,
				c = $(a);
				c.on("scroll", function () {
					b.is.IE && "CSS1Compat" == document.compatMode ? (b.direction.y = a.document.documentElement.scrollTop > b.top ? "down" : "up", b.direction.x = a.document.documentElement.scrollLeft > b.top ? "right" : "left", b.top = a.document.documentElement.scrollTop, b.left = a.document.documentElement.scrollLeft) : (b.direction.y = a.pageYOffset > b.top ? "down" : "up", b.direction.x = a.pageXOffset > b.top ? "right" : "left", b.top = a.pageYOffset, b.left = a.pageXOffset),
					b.trigger("scroll")
				}).trigger("scroll"),
				c.on("resize", function () {
					b.width = c.width(),
					b.height = c.height(),
					b.options.min_width && b.width < b.options.min_width && (b.width = b.options.min_width),
					b.trigger("resize")
				}).trigger("resize"),
				$(this.is.IE ? a.document : a).on("mousemove", function (a) {
					b.mouse.x = a.clientX,
					b.mouse.y = a.clientY,
					0 !== b.width && 0 !== b.height && (b.mouse.ratio_x = b.mouse.x / b.width, b.mouse.ratio_y = b.mouse.y / b.height),
					b.trigger("mousemove")
				}).trigger("mousemove")
			}
		})
}
(window), function (a) {
	"use strict";
	a.Hashtory = Abstract.extend({
			defaults : {
				type : "auto"
			},
			init : function (a, b) {
				this._super(a, b),
				"hashtag" === this.options.type && (this.options.type = "hash"),
				"history" !== this.options.type && "hash" !== this.options.type && (this.options.type = this.history_enable() ? "history" : "hash"),
				"history" === this.options.type ? this.init_history() : "hash" === this.options.type && this.init_hashtag()
			},
			init_history : function () {
				var b = this;
				this.type = "history",
				this.funcs = [],
				this.initial_pop = navigator.userAgent.toLowerCase().indexOf("chrome") > -1 || navigator.userAgent.toLowerCase().indexOf("safari") > -1,
				a.addEventListener("popstate", function () {
					b.initial_pop ? b.initial_pop = !1 : b.trigger("change", [a.location.pathname])
				})
			},
			init_hashtag : function () {
				var b = this;
				this.type = "hash",
				this.funcs = [],
				a.onhashchange = function () {
					var c = a.location.hash.replace("#", "");
					b.trigger("change", [c])
				}
			},
			push : function (b) {
				"history" === this.options.type ? (history.pushState(null, null, b), this.trigger("change", [a.location.pathname])) : a.location.hash = b
			},
			history_enable : function () {
				return !(!a.history || !history.pushState)
			}
		})
}
(window), function (a) {
	"use strict";
	a.Keyboard = Abstract.extend({
			defaults : {
				prevent : [],
				listening : !0
			},
			init : function (a, b) {
				this._super(a, b),
				this.listening = !!this.options.listening,
				this.listen_to_key_down()
			},
			listen_to_key_down : function (a, b) {
				var c = this;
				$(document).on("keydown", function (d) {
					return c.listening && (c.trigger("key_down", [d.keyCode]), _.isUndefined(a) || -1 === a.indexOf(d.keyCode) || "function" == typeof b && b.call(c, d.keyCode), -1 !== c.options.prevent.indexOf(d.keyCode)) ? !1 : void 0
				})
			}
		})
}
(window), function (a) {
	"use strict";
	a.Retina = Abstract.extend({
			defaults : {
				pixel_ratio : "auto",
				retina_class : "retina",
				retina_applied_class : "retined",
				suffix : "@2x"
			},
			init : function (b, c) {
				this._super(b, c),
				this.active = "auto" === this.options.pixel_ratio ? a.devicePixelRatio > 1 || a.matchMedia && a.matchMedia("(-webkit-min-device-pixel-ratio: 1.5),(-moz-min-device-pixel-ratio: 1.5),(min-device-pixel-ratio: 1.5)").matches : parseFloat(this.options.pixel_ratio) >= 1.5
			},
			add : function (a) {
				var b = this;
				if (!this.active)
					return !1;
				if (_.isUndefined(a) && (a = $("body")), !a.length)
					return !1;
				var c = a.find("." + this.options.retina_class + ":not(." + this.options.retina_applied_class + ")"),
				d = null;
				c.each(function () {
					var a = $(this);
					a.is("img") ? (d = b.add_retina_to_src(a.attr("src")), d && (a.attr("src", d), a.addClass(b.options.retina_applied_class))) : (d = a.css("background-image").replace(/url\((.*)\)/, "$1"), d && (d = b.add_retina_to_src(d), a.css({
								backgroundImage : "url(" + d + ")"
							})))
				})
			},
			add_retina_to_src : function (a, b) {
				if (_.isUndefined(a) || "" === a)
					return !1;
				if (_.isUndefined(b) && (b = this.options.suffix), -1 !== a.indexOf(b))
					return a;
				var c = a.split(".");
				return c.length < 2 ? a : (c[c.length - 2] += b, a = c.join("."))
			}
		})
}
(window), function (a) {
	"use strict";
	a.Top = Abstract.extend({
			defaults : {
				current_url : ""
			},
			init : function (a, b) {
				var c = this;
				this._super(a, b),
				this.blocks = {},
				this.blocks.main = $("section.top"),
				this.blocks.img = this.blocks.main.find("img:not(.no-top)"),
				this.height = 0,
				this.images = new Images,
				this.retracted = !0,
				this.expand_tries = 0,
				this.last_src = "",
				this.picto = this.blocks.main.find(".animated-picto"),
				this.picto_anim = new Animated_Picto(this, {
						target : this.picto,
						play : !0
					}),
				TweenLite.to(this.picto, .4, {
					css : {
						autoAlpha : 1
					},
					delay : 1
				}),
				this.blocks.main.length && (this.blocks.img.length && "" !== this.blocks.img.attr("src") ? c.set_image(c.blocks.img.attr("src"), !1, !0) : this.retract(!1), this.blocks.main.on("click", function () {
						c.trigger("click")
					}))
			},
			set_image : function (a, b, c, d, e) {
				var f = this,
				g = new Images;
				_.isUndefined(b) && (b = !0),
				_.isUndefined(c) && (c = !0),
				_.isUndefined(d) && (d = !0),
				this.last_src === a ? this.retracted && this.expand() : (this.last_src = a, g.load(a, function (a) {
						f.add_image(a[0], d),
						"function" == typeof e && e.call(this)
					}))
			},
			add_image : function (a, b) {
				var c = this;
				TweenLite.set(a, {
					autoAlpha : 0
				}),
				this.blocks.main.append(a),
				this.blocks.img = this.blocks.main.find("img:not(.no-top)"),
				this.recenter(),
				b ? TweenLite.to(a, .6, {
					css : {
						autoAlpha : 1
					},
					onComplete : function () {
						c.blocks.main.find("img:not(.no-top)").not(a).remove()
					}
				}) : TweenLite.set(a, {
					css : {
						autoAlpha : 1
					}
				}),
				this.retracted && this.expand()
			},
			update : function (a) {
				this.height = a.height,
				this.retracted || (TweenLite.set(this.blocks.main, {
						css : {
							height : this.height
						}
					}), this.recenter())
			},
			retract : function (a) {
				this.retracted = !0,
				this.expanded = !1,
				_.isUndefined(a) && (a = !0),
				a ? TweenLite.to(this.blocks.main, 1, {
					css : {
						height : 0
					}
				}) : TweenLite.set(this.blocks.main, {
					css : {
						height : 0
					}
				})
			},
			expand : function (b) {
				var c = this;
				this.retracted = !1,
				this.expanded = !0,
				0 === this.height && this.expand_tries < 5 ? (a.setTimeout(function () {
						c.expand(b)
					}, 1e3), c.expand_tries++) : (_.isUndefined(b) && (b = !0), b ? (TweenLite.to(this.blocks.main, 1, {
							css : {
								height : this.height
							}
						}), c.recenter()) : TweenLite.set(this.blocks.main, {
						css : {
							height : this.height
						}
					}))
			},
			recenter : function () {
				if (this.blocks.img.length && this.blocks.img[0].width && this.blocks.img[0].height) {
					var a = this.images.get_proportions(this.blocks.img[0].width, this.blocks.img[0].height, this.blocks.main.width(), this.height, "fill", "center", "middle", "round");
					TweenLite.set(this.blocks.main.find("img:not(.no-top)"), {
						css : a
					})
				}
			}
		})
}
(window), function (a) {
	"use strict";
	a.Scroll_Push = Abstract.extend({
			defaults : {
				height : 46,
				time_before_wiggle : 2,
				animation_duration : .2
			},
			init : function (a, b) {
				this._super(a, b),
				this.blocks = {},
				this.blocks.main = $("section.scroll"),
				this.blocks.arrow = this.blocks.main.find(".arrow"),
				this.active = !0,
				this.shown = !1,
				this.hidden = !0,
				this.show_count = 0,
				this.init_event(),
				this.start_auto_wiggle()
			},
			init_event : function () {
				var a = this;
				this.blocks.main.on("mouseenter mouseleave click", function (b) {
					switch (b.type) {
					case "mouseover":
						a.shown && TweenLite.to(a.blocks.main, a.options.animation_duration, {
							css : {
								height : a.options.height + 14,
								lineHeight : a.options.height + 14
							}
						});
						break;
					case "mouseout":
						a.active && TweenLite.to(a.blocks.main, a.options.animation_duration, {
							css : {
								height : a.options.height,
								lineHeight : a.shown ? a.options.height : 0
							}
						});
						break;
					case "click":
						a.set_active(!1),
						a.trigger("click")
					}
				})
			},
			start_auto_wiggle : function () {
				var b = this;
				this.active && a.setTimeout(function () {
					b.wiggle()
				}, 1e3 * this.options.time_before_wiggle)
			},
			wiggle : function () {
				var b = this;
				if (this.active) {
					var c = .1;
					TweenLite.to(this.blocks.main, c, {
						css : {
							height : 56,
							lineHeight : 56
						}
					}),
					TweenLite.to(this.blocks.main, c, {
						css : {
							height : 46,
							lineHeight : 46
						},
						delay : c
					}),
					TweenLite.to(this.blocks.main, c, {
						css : {
							height : 56,
							lineHeight : 56
						},
						delay : 2 * c
					}),
					TweenLite.to(this.blocks.main, c, {
						css : {
							height : 46,
							lineHeight : 46
						},
						delay : 3 * c
					})
				}
				a.setTimeout(function () {
					b.wiggle()
				}, 1e3 * this.options.time_before_wiggle)
			},
			show : function () {
				this.hidden && this.active && (this.show_count++, this.shown = !0, this.hidden = !1, TweenLite.to(this.blocks.main, this.options.animation_duration, {
						css : {
							height : this.options.height,
							lineHeight : this.options.height
						}
					}))
			},
			hide : function () {
				this.shown && (this.shown = !1, this.hidden = !0, TweenLite.to(this.blocks.main, this.options.animation_duration, {
						css : {
							height : 0,
							lineHeight : 0
						}
					}))
			},
			set_active : function (a) {
				this.active = a,
				!a && this.shown && this.hide(),
				a && !this.shown && this.show()
			}
		})
}
(window), function (a) {
	"use strict";
	a.Blocks = Abstract.extend({
			defaults : {},
			init : function (a, b) {
				this._super(a, b),
				this.blocks = {},
				this.blocks.main = this.options.target,
				this.blocks.items = this.blocks.main.find(".block"),
				this.visible = !1,
				this.init_carrousels(),
				this.init_images()
			},
			init_images : function () {
				var b = this;
				this.blocks.items.find("img.picture").each(function () {
					var c = $(this),
					d = new Images,
					e = null;
					b.options.retina.active ? (e = b.options.retina.add_retina_to_src(c.attr("src")), c.attr("src", e)) : e = c.attr("src"),
					d.load(e, function () {
						"development" === b.parent.parent.options.env ? a.setTimeout(function () {
							TweenLite.to(c, .4, {
								css : {
									autoAlpha : 1
								}
							})
						}, 3e3 * Math.random()) : TweenLite.to(c, .4, {
							css : {
								autoAlpha : 1
							}
						})
					})
				})
			},
			init_carrousels : function () {
				var a = this;
				this.carrousels = [],
				this.blocks.items.find(".carrousel").each(function () {
					a.carrousels.push(new Carrousel(a, {
							target : $(this),
							controls_container : "controls",
							pagination_inner : "<span></span>",
							arrows_inner : '<span class="bar bar-1"></span><span class="bar bar-2"></span>'
						}))
				})
			},
			update : function (a) {
				var b = a.width;
				TweenLite.set(this.blocks.items, {
					css : {
						height : Math.round(b / 3 * 2 / (16 / 9))
					}
				}),
				TweenLite.set(this.blocks.items.filter(".format-4"), {
					css : {
						height : Math.round(b / (16 / 9))
					}
				});
				for (var c = this.carrousels.length; c--; )
					this.carrousels[c].update();
				this.visible || (this.visible = !0, TweenLite.to(this.blocks.main, .4, {
						css : {
							autoAlpha : 1
						}
					}))
			}
		})
}
(window), function (a) {
	"use strict";
	a.Carrousel = Abstract.extend({
			defaults : {
				pagination : !0,
				pagination_inner : "",
				arrows : !0,
				arrows_inner : "",
				animation_auto : !1,
				animation_auto_duration : 3,
				transition_duration : .6,
				transition_direction : "horizontal",
				controls_container : null,
				classes : {
					initiated : "initiated",
					item : "item",
					container : "items",
					horizontal : "horizontal",
					vertical : "vertical",
					pagination : "pagination",
					arrow : "arrow",
					arrow_prev : "prev",
					arrow_next : "next"
				}
			},
			init : function (a, b) {
				return this._super(a, b),
				!this.options.target.length || this.options.target.hasClass(this.options.classes.initiated) ? !1 : (this.blocks = {}, this.blocks.main = this.options.target, this.blocks.container = this.blocks.main.find("." + this.options.classes.container).first(), this.blocks.items = this.blocks.container.find("." + this.options.classes.item), this.count = this.blocks.items.length, this.current = 0, this.timeout = null, this.positions = [], this.tween = null, this.blocks.items.length <= 1 ? !1 : (this.create_dom(), this.set_pagination(), this.set_arrows(), this.set_auto_animation(), this.set_touch(), void this.blocks.main.addClass(this.options.classes.initiated)))
			},
			set_touch : function () {
				var a = this,
				b = 0,
				c = 0,
				d = 0,
				e = 0,
				f = 0,
				g = 0,
				h = null;
				this.blocks.container.on("touchstart touchmove touchend", function (i) {
					switch (h = i.changedTouches, i.type) {
					case "touchstart":
						TweenLite.killTweensOf(a.blocks.container),
						b = parseInt(a.blocks.container.css("left"), 10),
						d = h[0].clientX,
						f = h[0].clientY;
						break;
					case "touchmove":
						if (e = h[0].clientX - d, g = h[0].clientY - f, e > 10 || -10 > e)
							return c = b + e, a.blocks.container.css("left", c), !1;
						break;
					case "touchend":
						e > 100 ? a.current > 0 ? a.prev() : a.go_to(a.current) : -100 > e && a.current < a.count - 1 ? a.next() : a.go_to(a.current)
					}
				})
			},
			next : function () {
				this.current++,
				this.current > this.count - 1 && (this.current = 0),
				this.go_to(this.current),
				this.set_auto_animation()
			},
			prev : function () {
				this.current--,
				this.current < 0 && (this.current = this.count - 1),
				this.go_to(this.current),
				this.set_auto_animation()
			},
			go_to : function (a) {
				a > this.count - 1 && (a = this.count - 1),
				0 > a && (a = 0),
				this.options.pagination && (this.blocks.pagination_items.removeClass("active"), this.blocks.pagination_items.eq(a).addClass("active")),
				TweenLite.killTweensOf(this.blocks.container),
				"horizontal" === this.options.transition_direction ? this.tween = TweenLite.to(this.blocks.container, this.options.transition_duration, {
						css : {
							left : -this.positions[a]
						}
					}) : "vertical" === this.options.transition_direction && (this.tween = TweenLite.to(this.blocks.container, this.options.transition_duration, {
								css : {
									top : -this.positions[a]
								}
							})),
				this.current = a
			},
			set_auto_animation : function () {
				var b = this;
				this.options.animation_auto && (this.timeout && a.clearTimeout(this.timeout), this.timeout = a.setTimeout(function () {
							b.next()
						}, 1e3 * this.options.animation_auto_duration))
			},
			set_pagination : function () {
				var a = this;
				if (this.options.pagination) {
					this.blocks.pagination = this.blocks.main.find(".pagination");
					for (var b = this.count; b--; )
						this.blocks.pagination.append('<div class="item">' + this.options.pagination_inner + "</div>");
					this.blocks.pagination_items = this.blocks.pagination.find(".item"),
					this.blocks.pagination_items.eq(this.current).addClass("active"),
					this.blocks.pagination_items.on("click touchstart", function (b) {
						b.preventDefault(),
						a.go_to(a.blocks.pagination_items.index($(this)))
					})
				}
			},
			set_arrows : function () {
				var a = this;
				this.options.arrows && (this.blocks.arrows = this.blocks.main.find(".arrow"), this.blocks.arrows.on("click touchstart", function (b) {
						b.preventDefault();
						var c = $(this);
						c.hasClass(a.options.classes.arrow_prev) ? a.prev() : c.hasClass(a.options.classes.arrow_next) && a.next(),
						a.set_auto_animation()
					}))
			},
			update : function () {
				TweenLite.set(this.blocks.items, {
					css : {
						width : this.blocks.main.width()
					}
				}),
				"horizontal" === this.options.transition_direction ? this.bloc_offset = this.blocks.container.offset().left : "vertical" === this.options.transition_direction && (this.bloc_offset = this.blocks.container.offset().top),
				this.set_positions(),
				"horizontal" === this.options.transition_direction ? TweenLite.set(this.blocks.container, {
					css : {
						left : -this.positions[this.current]
					}
				}) : "vertical" === this.options.transition_direction && TweenLite.set(this.blocks.container, {
					css : {
						top : -this.positions[this.current]
					}
				})
			},
			set_positions : function () {
				this.positions = [];
				for (var a = 0; a < this.blocks.items.length; a++)
					"horizontal" === this.options.transition_direction ? this.positions.push(a * this.blocks.main.width()) : "vertical" === this.options.transition_direction && this.positions.push(a * this.blocks.main.height())
			},
			create_dom : function () {
				"horizontal" === this.options.transition_direction ? this.blocks.main.addClass(this.options.classes.horizontal).removeClass(this.options.classes.vertical) : "vertical" === this.options.transition_direction && this.blocks.main.addClass(this.options.classes.vertical).removeClass(this.options.classes.horizontal),
				this.options.pagination && 0 === this.blocks.main.find("." + this.options.classes.pagination).length && (this.options.controls_container ? this.blocks.main.find("." + this.options.controls_container).append('<div class="' + this.options.classes.pagination + '"></div>') : this.blocks.main.append('<div class="' + this.options.classes.pagination + '"></div>')),
				this.options.arrows && 0 === this.blocks.main.find("." + this.options.classes.arrow + "." + this.options.classes.arrow_next).length && (this.options.controls_container ? this.blocks.main.find("." + this.options.controls_container).append('<div class="' + this.options.classes.arrow + " " + this.options.classes.arrow_next + '">' + this.options.arrows_inner + "</div>") : this.blocks.main.append('<div class="' + this.options.classes.arrow + " " + this.options.classes.arrow_next + '"></div>')),
				this.options.arrows && 0 === this.blocks.main.find("." + this.options.classes.arrow + "." + this.options.classes.arrow_prev).length && (this.options.controls_container ? this.blocks.main.find("." + this.options.controls_container).append('<div class="' + this.options.classes.arrow + " " + this.options.classes.arrow_prev + '">' + this.options.arrows_inner + "</div>") : this.blocks.main.append('<div class="' + this.options.classes.arrow + " " + this.options.classes.arrow_prev + '"></div>'))
			}
		})
}
(window), function (a) {
	"use strict";
	a.Header = Abstract.extend({
			defaults : {
				nav_active_color : "#306B00",
				nav_inactive_color : "#fff",
				nav_inactive_opacity : .3,
				subnav_item_active_color : "#eeeded",
				subnav_item_inactive_color : "#ffffff",
				subnav_item_inactive_alpha : .5,
				retracted_height : 125,
				height : 513,
				pagination_item_width : 250,
				mask_alpha : .5,
				is_tablet : !1,
				theme : "light",
				default_expanded : !0
			},
			init : function (a, b) {
				this._super(a, b),
				this.blocks = {},
				this.blocks.main = $("header"),
				this.blocks.handle = {},
				this.blocks.handle.main = this.blocks.main.find(".handle"),
				this.blocks.handle.icon_cross = this.blocks.handle.main.find(".cross"),
				this.blocks.handle.icon_list = this.blocks.handle.main.find(".list"),
				this.blocks.reserve = {},
				this.blocks.reserve.main = this.blocks.main.find(".reserve"),
				this.blocks.reserve.link = this.blocks.reserve.main.find("a"),
				this.blocks.mask = {},
				this.blocks.mask.main = $(".header-mask"),
				this.blocks.nav = {},
				this.blocks.nav.main = this.blocks.main.find("nav"),
				this.blocks.nav.list = this.blocks.main.find(".list-container"),
				this.blocks.nav.ul = this.blocks.main.find("ul"),
				this.blocks.nav.items = this.blocks.nav.main.find("li a"),
				this.blocks.nav.h1 = this.blocks.nav.main.find("h1"),
				this.blocks.subnavs = {},
				this.blocks.subnavs.main = this.blocks.main.find(".subnavs"),
				this.blocks.subnavs.items = this.blocks.subnavs.main.find(".subnav"),
				this.blocks.fixed_links = $(".fixed-links"),
				this.blocks.fixed_lang = this.blocks.fixed_links.find(".lang"),
				this.blocks.fixed_reserve = this.blocks.fixed_links.find(".reserve"),
				this.blocks.menu_lang = this.blocks.subnavs.items.find("li.langs"),
				this.blocks.arrow = this.blocks.main.find(".arrow"),
				this.blocks.arrow_inner = this.blocks.arrow.find(".inner"),
				this.top = 0,
				this.expanded = !0,
				this.shown = !1,
				this.arrow_shown = !1,
				this.reserve_shown = null,
				this.mask_shown = !1,
				this.pagination_active = !1,
				this.funnel = new Funnel(this, {}),
				TweenLite.set(this.blocks.subnavs.items.not(".active"), {
					css : {
						autoAlpha : 0
					}
				}),
				TweenLite.set(this.blocks.subnavs.main, {
					css : {
						autoAlpha : 0
					}
				}),
				this.init_fallback(),
				this.init_pagination(),
				this.init_events()
			},
			init_fallback : function () {
				Modernizr.backgroundsize || this.blocks.subnavs.items.find(".picture").each(function () {
					var a = $(this),
					b = a.find("img"),
					c = a.css("background-image").replace(/url\((.*)\)/, "$1");
					'"' === c[0] && (c = c.substring(1)),
					'"' === c[c.length - 1] && (c = c.substring(0, c.length - 1)),
					a.css("background-image", ""),
					a.addClass("fallback"),
					b.attr("src", c)
				})
			},
			init_pagination : function () {
				this.blocks.pagination = {},
				this.blocks.pagination.main = this.blocks.main.find(".paginations"),
				this.blocks.pagination.inner = this.blocks.pagination.main.find(".inner"),
				this.blocks.pagination.items = this.blocks.pagination.main.find(".pagination"),
				this.blocks.pagination.inner_items = this.blocks.pagination.items.find(".item"),
				this.pagination = {},
				TweenLite.set(this.blocks.pagination.inner_items, {
					css : {
						autoAlpha : 0
					}
				}),
				TweenLite.set(this.blocks.pagination.items, {
					css : {
						autoAlpha : 0
					}
				});
				var a = this.blocks.pagination.items.filter(".active");
				if (!a.length)
					return void TweenLite.set(this.blocks.pagination.main, {
						css : {
							right : -134
						}
					});
				TweenLite.set(a, {
					css : {
						autoAlpha : 1
					}
				});
				var b = a.find(".active");
				b.length && (this.blocks.pagination.container = b.parent(".items"), this.blocks.pagination.container.length && (this.pagination_active = !0, TweenLite.set(b, {
							css : {
								autoAlpha : 1
							}
						})))
			},
			set_pagination : function (a, b) {
				if (this.pagination_active = !1, _.isUndefined(a) || _.isUndefined(b))
					return !1;
				var c = this.blocks.pagination.items.filter(".active"),
				d = this.blocks.pagination.items.filter("." + a);
				if (d.length) {
					var e = c.length ? d.find(".active") : [],
					f = d.find("." + b);
					f.length && (this.pagination_active = !0, this.blocks.pagination.items.find(".item").each(function () {
							var a = $(this);
							"hidden" !== a.css("visibility") && TweenLite.to(a, .3, {
								css : {
									top : -10,
									autoAlpha : 0
								}
							})
						}), TweenLite.to(this.blocks.pagination.main, .3, {
							css : {
								right : 116
							},
							delay : e.length ? .3 : 0
						}), TweenLite.to(this.blocks.pagination.items, .3, {
							css : {
								autoAlpha : 0
							},
							delay : e.length ? .3 : 0
						}), TweenLite.to(d, .3, {
							css : {
								autoAlpha : 1
							},
							delay : e.length ? .4 : 0
						}), this.blocks.pagination.items.removeClass("active"), d.addClass("active"), d.find(".item").removeClass("active"), f.addClass("active"), this.blocks.pagination.container = f.parent(".items"), TweenLite.fromTo(f, .3, {
							css : {
								top : -10,
								autoAlpha : 0
							}
						}, {
							css : {
								top : 0,
								autoAlpha : 1
							},
							delay : e.length ? .3 : 0
						}))
				} else
					this.blocks.pagination.items.removeClass("active"), TweenLite.to(this.blocks.pagination.main, .4, {
						css : {
							right : -134
						}
					})
			},
			init_events : function () {
				var a = this;
				this.blocks.nav.items.on("mouseleave", function () {
					a.funnel.active || (a.funnel.active = !0, a.funnel.update_from_cursor_to_object(a.blocks.subnavs.main))
				}),
				this.blocks.nav.items.on("mouseenter touchstart", function (b) {
					var c = $(this);
					if (a.shown && a.expanded) {
						if (a.funnel.prevent(c, b.type))
							return !1;
						a.funnel.active = !1,
						a.funnel.update_debug(),
						a.blocks.nav.items.removeClass("active"),
						c.addClass("active"),
						TweenLite.to(c, .2, {
							css : {
								color : a.options.nav_active_color,
								opacity : 1
							}
						}),
						TweenLite.to(a.blocks.nav.items.not(".active"), .2, {
							css : {
								color : a.options.nav_inactive_color,
								opacity : a.options.nav_inactive_opacity
							}
						});
						var d = c.data("target-subnav"),
						e = !1;
						return _.isUndefined(d) ? (a.hide_subnavs(), TweenLite.to(a.blocks.subnavs.items.find(".item.active"), .2, {
								css : {
									backgroundColor : a.options.subnav_item_inactive_color
								}
							}), a.show_mask()) : (d = a.blocks.subnavs.items.filter("." + d), e = d.hasClass("more"), TweenLite.to(a.blocks.subnavs.main, .3, {
								autoAlpha : 1
							}), TweenLite.to(a.blocks.arrow, .2, {
								right : a.blocks.nav.list.width() - c.offset().left + a.blocks.nav.h1.width() - c.width() / 2 - 10
							}), a.arrow_shown || (a.arrow_shown = !0, TweenLite.to(a.blocks.arrow_inner, .2, {
									css : {
										top : 0
									}
								})), a.blocks.subnavs.items.removeClass("active"), d.addClass("active"), TweenLite.set(d, {
								zIndex : 1
							}), TweenLite.set(a.blocks.subnavs.items.not(".active"), {
								zIndex : 0
							}), TweenLite.to(d, .2, {
								css : {
									autoAlpha : 1
								},
								onComplete : function () {
									e || (TweenLite.to(a.blocks.subnavs.items.not(".active"), .2, {
											css : {
												autoAlpha : 0
											}
										}), TweenLite.to(a.blocks.subnavs.items.not(".active").find("img"), .2, {
											css : {
												autoAlpha : 1
											}
										}))
								}
							}), e && (TweenLite.to(a.blocks.subnavs.items.not(".active"), .2, {
									css : {
										autoAlpha : 0
									},
									delay : .1
								}), TweenLite.to(a.blocks.subnavs.items.not(".active").find("img"), .2, {
									css : {
										autoAlpha : 1
									},
									delay : .1
								})), a.show_mask(), TweenLite.to(a.blocks.subnavs.items.not(".active").find(".item.active"), .2, {
								css : {
									backgroundColor : a.options.subnav_item_inactive_color
								}
							})),
						"touchstart" === b.type ? !1 : void 0
					}
				}),
				this.blocks.nav.items.on("click", function (a) {
					return a.preventDefault(),
					!1
				}),
				this.blocks.subnavs.items.find(".item").on("mouseenter", function () {
					var b = $(this),
					c = b.siblings(".item");
					b.addClass("active"),
					c.removeClass("active"),
					TweenLite.to(b, .4, {
						css : {
							backgroundColor : a.options.subnav_item_active_color
						}
					}),
					TweenLite.to(b.find("img"), .4, {
						css : {
							autoAlpha : 1
						}
					}),
					TweenLite.to(c, .4, {
						css : {
							backgroundColor : a.options.subnav_item_inactive_color
						}
					}),
					TweenLite.to(c.find("img"), .4, {
						css : {
							autoAlpha : a.options.subnav_item_inactive_alpha
						}
					})
				}),
				this.blocks.subnavs.items.find("a").on("click touchstart", function () {
					a.blocks.main.trigger("mouseout")
				}),
				this.blocks.main.on("mouseleave", function () {
					a.blocks.nav.items.filter(".active").removeClass("active"),
					TweenLite.to(a.blocks.nav.items, .2, {
						css : {
							color : a.options.nav_inactive_color,
							opacity : 1
						}
					}),
					a.hide_subnavs(),
					a.hide_mask(),
					TweenLite.to(a.blocks.subnavs.items.find(".item.active"), .4, {
						css : {
							backgroundColor : a.options.subnav_item_inactive_color
						}
					}),
					TweenLite.to(a.blocks.subnavs.items.find("img"), .4, {
						css : {
							autoAlpha : 1
						}
					})
				}),
				this.blocks.nav.h1.on("mouseenter", function () {
					TweenLite.to(a.blocks.nav.items, .2, {
						css : {
							color : a.options.nav_inactive_color,
							opacity : 1
						}
					}),
					a.hide_subnavs(),
					TweenLite.to(a.blocks.subnavs.items.find(".item.active"), .4, {
						css : {
							backgroundColor : a.options.subnav_item_inactive_color
						}
					})
				}),
				this.blocks.handle.main.on("mouseenter", function () {
					TweenLite.to(a.blocks.nav.items, .2, {
						css : {
							color : a.options.nav_inactive_color,
							opacity : 1
						}
					}),
					a.hide_subnavs(),
					TweenLite.to(a.blocks.subnavs.items.find(".item.active"), .4, {
						css : {
							backgroundColor : a.options.subnav_item_inactive_color
						}
					})
				}),
				this.blocks.handle.main.on("click touchstart", function () {
					return a.expanded ? (a.options.default_expanded = !1, a.hide_subnavs(), a.retract()) : (a.options.default_expanded = !0, a.expand()),
					a.hide_mask(),
					a.trigger("handle_click"),
					!1
				}),
				this.blocks.reserve.main.on("mouseenter", function () {
					TweenLite.to(a.blocks.reserve.link, .2, {
						css : {
							color : "#fff",
							backgroundColor : "#6CC829"
						}
					}),
					TweenLite.to(a.blocks.reserve.link.find(".u"), .2, {
						css : {
							backgroundColor : "#fff"
						}
					}),
					a.hide_subnavs(),
					TweenLite.to(a.blocks.subnavs.items.find(".item.active"), .4, {
						css : {
							backgroundColor : a.options.subnav_item_inactive_color
						}
					})
				}),
				this.blocks.reserve.main.on("mouseleave", function () {
					TweenLite.to(a.blocks.reserve.link, .2, {
						css : {
							color : "#fff",
							backgroundColor : "#00C1E9"
						}
					}),
					TweenLite.to(a.blocks.reserve.link.find(".u"), .2, {
						css : {
							backgroundColor : "#fff"
						}
					})
				}),
				this.blocks.pagination.items.find("a").on("click touchstart", function () {
					var b = $(this),
					c = b.attr("href");
					return a.trigger("ajax_click", [c]),
					!1
				})
			},
			hide_subnavs : function () {
				var a = this;
				this.blocks.subnavs.items.removeClass("active"),
				a.arrow_shown && (this.arrow_shown = !1, TweenLite.to(this.blocks.arrow_inner, .2, {
						css : {
							top : 10
						}
					})),
				"hidden" !== a.blocks.subnavs.main.css("visibility") && TweenLite.to(this.blocks.subnavs.main, .4, {
					css : {
						autoAlpha : 0
					}
				})
			},
			show : function (a) {
				var b = this;
				this.shown = !0,
				_.isUndefined(a) && (a = !1),
				a && this.retract(!1),
				TweenLite.fromTo(this.blocks.main, .5, {
					css : {
						top : this.top - 100,
						autoAlpha : 0
					}
				}, {
					css : {
						top : this.top,
						autoAlpha : 1
					},
					onComplete : function () {
						b.trigger("shown")
					}
				}),
				this.trigger("show")
			},
			hide : function () {
				var a = this;
				this.shown = !1,
				TweenLite.fromTo(this.blocks.main, .5, {
					css : {
						top : this.top,
						autoAlpha : 1
					}
				}, {
					css : {
						top : this.top - 100,
						autoAlpha : 0
					},
					onComplete : function () {
						a.trigger("hidden")
					}
				}),
				this.trigger("hide")
			},
			update : function (a) {
				if (!this.options.is_tablet) {
					a.height < 760 ? (this.options.retracted_height = 105, this.options.height = 493) : (this.options.retracted_height = 125, this.options.height = 513);
					var b = a.height / 2 - this.options.retracted_height / 2 - a.top,
					c = parseInt(this.blocks.main.css("top").replace("px", ""), 10),
					d = a.height / 2 - this.options.retracted_height / 2;
					if(typeof this.options.fixedTop == 'number')b=this.options.fixedTop;
					TweenLite.set(this.blocks.subnavs.main, {
						css : {
							height : d
						}
					}),
					0 > b && (b = 0),
					b !== c && TweenLite.set(this.blocks.main, {
						top : b
					}),
					(this.top !== b || null === this.reserve_shown) && (0 === b ? ((this.reserve_shown === !1 || null === this.reserve_shown) && this.show_reserve(), this.expanded || this.expand()) : ((this.reserve_shown === !0 || null === this.reserve_shown) && this.hide_reserve(), !this.options.default_expanded && this.expanded && this.retract()), this.top = b)
				}
			},
			retract : function (a) {
				var b = this;
				_.isUndefined(a) && (a = !0),
				a ? (TweenLite.to(this.blocks.nav.items, .3, {
						css : {
							autoAlpha : 0
						}
					}), TweenLite.to(this.blocks.nav.ul, .6, {
						css : {
							left : "100%"
						},
						ease : Power1.easeIn,
						delay : .2
					}), TweenLite.to(this.blocks.handle.icon_cross, .3, {
						css : {
							autoAlpha : 0
						}
					}), TweenLite.to(this.blocks.handle.icon_list, .3, {
						css : {
							autoAlpha : 1
						}
					}), this.pagination_active && TweenLite.to(this.blocks.pagination.inner, .3, {
						css : {
							autoAlpha : 1
						},
						ease : Power1.easeOut,
						delay : .8
					})) : (TweenLite.set(this.blocks.nav.items, {
						css : {
							autoAlpha : 0
						}
					}), TweenLite.set(this.blocks.nav.ul, {
						css : {
							left : "100%"
						}
					}), TweenLite.set(this.blocks.handle.icon_cross, {
						css : {
							autoAlpha : 0
						}
					}), TweenLite.set(b.blocks.handle.icon_list, {
						css : {
							autoAlpha : 1
						}
					}), TweenLite.set(this.blocks.pagination.inner, {
						css : {
							autoAlpha : 1
						}
					})),
				this.expanded = !1,
				this.trigger("retract")
			},
			expand : function (a) {
				var b = this;
				_.isUndefined(a) && (a = !0),
				a ? (this.pagination_active && TweenLite.to(this.blocks.pagination.inner, .3, {
						css : {
							autoAlpha : 0
						},
						ease : Power1.easeOut
					}), TweenLite.to(this.blocks.nav.ul, .8, {
						css : {
							left : "0%"
						},
						delay : this.pagination_active ? .5 : 0,
						ease : Power3.easeOut
					}), TweenLite.to(this.blocks.nav.items, .3, {
						css : {
							autoAlpha : 1
						},
						delay : this.pagination_active ? .9 : .6
					}), TweenLite.to(this.blocks.handle.icon_list, .3, {
						css : {
							autoAlpha : 0
						}
					}), TweenLite.to(b.blocks.handle.icon_cross, .3, {
						css : {
							autoAlpha : 1
						}
					})) : (TweenLite.set(this.blocks.nav.ul, .3, {
						css : {
							left : "0%"
						}
					}), TweenLite.set(this.blocks.handle.icon_list, .3, {
						css : {
							autoAlpha : 0
						}
					}), TweenLite.set(b.blocks.handle.icon_cross, .3, {
						css : {
							autoAlpha : 1
						}
					})),
				this.expanded = !0,
				this.trigger("expand")
			},
			show_mask : function () {
				this.mask_shown || (this.mask_shown = !0, TweenLite.to(this.blocks.mask.main, .4, {
						autoAlpha : this.options.mask_alpha
					}))
			},
			hide_mask : function () {
				this.mask_shown && (this.mask_shown = !1, TweenLite.to(this.blocks.mask.main, .4, {
						autoAlpha : 0
					}))
			},
			show_reserve : function () {
				this.reserve_shown = !0,
				TweenLite.to(this.blocks.reserve.main, .2, {
					css : {
						autoAlpha : 1
					}
				})
			},
			hide_reserve : function () {
				this.reserve_shown = !1,
				TweenLite.to(this.blocks.reserve.main, .2, {
					css : {
						autoAlpha : 0
					}
				})
			},
			set_theme : function (a) {
				"dark" === a ? (this.options.theme = "dark", this.blocks.fixed_links.addClass("dark")) : (this.options.theme = "light", this.blocks.fixed_links.removeClass("dark"))
			},
			set_langs_urls : function (a) {
				var b = this;
				$.each(a, function (a, c) {
					b.blocks.menu_lang.find("." + a).attr("href", c),
					b.blocks.fixed_lang.find("." + a).attr("href", c)
				})
			}
		})
}
(window), function (a) {
	"use strict";
	a.Schedules = Abstract.extend({
			defaults : {
				open_height : 232,
				retracted_height : 125,
				retracted_height_responsive : 105
			},
			init : function (a, b) {
				this._super(a, b),
				this.blocks = {},
				this.blocks.main = $("section.schedules"),
				this.blocks.container = this.blocks.main.find(".items"),
				this.blocks.items = this.blocks.main.find("a.item"),
				this.tweens = {},
				this.tweens.main = null,
				this.tweens.container = null,
				this.top = 0,
				this.shown = !1,
				this.timestamp = parseInt((new Date).getTime() / 1e3, 10),
				this.images_top = [],
				this.images_top_themes = [],
				this.index = 0,
				this.timeout = null,
				this.define_current()
			},
			next : function () {
				this.index++,
				this.index >= this.images_top.length && (this.index = 0),
				this.current_top = this.images_top[this.index],
				this.trigger("update_top_image", [this.current_top, this.images_top_themes[this.index]])
			},
			go : function () {
				var b = this;
				if (TweenLite.to(this.current, .4, {
						css : {
							autoAlpha : 0
						},
						onComplete : function () {
							b.current.removeClass("active")
						}
					}), this.current = this.blocks.items.eq(this.index), this.current.addClass("active"), TweenLite.fromTo(this.current, .4, {
						css : {
							autoAlpha : 0,
							display : "block"
						}
					}, {
						css : {
							autoAlpha : 1
						},
						delay : .2
					}), this.current.hasClass("current")) { {
						var c = this.current.find(".hour");
						this.current.find(".display")
					}
					c.text(("0" + (new Date).getHours()).slice(-2) + ":" + ("0" + (new Date).getMinutes()).slice(-2))
				}
				this.timeout = a.setTimeout(function () {
						b.next()
					}, parseInt(b.current.data("duration"), 10))
			},
			define_current : function () {
				var b = this;
				this.current_top = null,
				this.blocks.items.each(function () {
					var a = $(this);
					a.data("timestamp") <= b.timestamp && (b.index++, b.current = a, b.current_top = b.current.data("image-top")),
					b.images_top.push(a.data("image-top")),
					b.images_top_themes.push(a.data("image-top-theme"))
				}),
				this.index--,
				this.current_top || (this.index = this.images_top.length - 1, this.current = this.blocks.items.last(), this.current_top = this.current.data("image-top"));
				var c = this.current.find(".hour"),
				d = this.current.find(".display");
				d.hide(),
				c.css("display", "block"),
				c.text(("0" + (new Date).getHours()).slice(-2) + ":" + ("0" + (new Date).getMinutes()).slice(-2)),
				this.current.addClass("active"),
				this.current.addClass("current"),
				this.timeout = a.setTimeout(function () {
						b.next()
					}, parseInt(b.current.data("duration"), 10))
			},
			show : function (a, b) {
				_.isUndefined(a) && (a = !0),
				_.isUndefined(top) && (b = !1),
				a ? (TweenLite.killTweensOf(this.blocks.main), TweenLite.killTweensOf(this.blocks.container), TweenLite.to(this.blocks.main, .5, {
						css : {
							autoAlpha : 1,
							height : this.options.open_height
						},
						delay : .8
					}), TweenLite.to(this.blocks.container, .3, {
						css : {
							autoAlpha : 1
						},
						delay : 1
					})) : (TweenLite.set(this.blocks.main, {
						css : {
							height : this.options.open_height
						}
					}), TweenLite.set(this.blocks.container, {
						css : {
							autoAlpha : 1
						}
					})),
				this.shown = !0
			},
			hide : function (a, b) {
				_.isUndefined(b) && (b = !1),
				_.isUndefined(a) && (a = !0),
				a ? (TweenLite.killTweensOf(this.blocks.main), TweenLite.killTweensOf(this.blocks.container), TweenLite.to(this.blocks.main, .5, {
						css : {
							height : b ? this.options.retracted_height_responsive : this.options.retracted_height
						}
					}), TweenLite.to(this.blocks.container, .2, {
						css : {
							autoAlpha : 0
						}
					})) : (TweenLite.set(this.blocks.main, {
						css : {
							height : b ? this.options.retracted_height_responsive : this.options.retracted_height
						}
					}), TweenLite.set(this.blocks.container, {
						css : {
							autoAlpha : 0
						}
					})),
				this.shown = !1
			},
			destroy : function () {
				this._super(),
				a.clearTimeout(this.timeout)
			}
		})
}
(window), function (a) {
	"use strict";
	a.Music = Abstract.extend({
			defaults : {
				fade_duration : 2,
				base_url : "",
				path : "src/medias/music/",
				file_name : "Cheval-Blanc",
				active : !0,
				max_volume : 1
			},
			init : function (a, b) {
				this._super(a, b),
				this.blocks = {},
				this.blocks.button = $(".fixed-links .sound"),
				this.playing = !1,
				this.active = !1,
				this.created = !1,
				this.enable = !0,
				this.audio = this.create(),
				this.audio || (this.enable = !1),
				this.init_events()
			},
			init_events : function () {
				var a = this;
				this.blocks.button.on("click", function () {
					return a.playing ? a.pause() : a.play(),
					!1
				})
			},
			get_path : function (a) {
				return this.add_end_slash(this.options.base_url) + this.add_end_slash(this.options.path) + this.options.file_name + "." + a
			},
			add_end_slash : function (a) {
				return a + ("/" !== a[a.length - 1] ? "/" : "")
			},
			create : function () {
				var a = document.createElement("audio"),
				b = document.createElement("source");
				return a.canPlayType ? (a.canPlayType("audio/mpeg;") ? (b.type = "audio/mpeg", b.src = this.get_path("mp3")) : (b.type = "audio/ogg", b.src = this.get_path("ogg")), a.appendChild(b), a) : !1
			},
			play : function (a) {
				return this.enable ? (_.isUndefined(a) && (a = this.options.fade_duration), TweenLite.to(this.audio, a, {
						volume : this.options.max_volume
					}), this.blocks.button.addClass("active"), this.playing = !0, this.activate(), void this.audio.play()) : !1
			},
			pause : function (a) {
				if (!this.enable)
					return !1;
				var b = this;
				_.isUndefined(a) && (a = this.options.fade_duration),
				this.blocks.button.removeClass("active"),
				this.playing = !1,
				TweenLite.to(this.audio, a, {
					volume : 0,
					onComplete : function () {
						b.audio.pause()
					}
				})
			},
			activate : function () {
				this.active || (this.active = !0, this.blocks.button.css({
						display : "inline-block"
					}))
			},
			desactivate : function () {
				this.active = !1,
				this.blocks.button.css({
					display : "none"
				})
			},
			reset : function (a) {
				return this.enable ? (_.isUndefined(a) && (a = this.options.fade_duration), this.audio.stop(), void this.audio.play()) : !1
			}
		})
}
(window);
var Animated_Picto;
!function () {
	"use strict";
	Animated_Picto = Abstract.extend({
			defaults : {
				play : !1,
				loop : !0,
				steps_count : 3,
				step_height : 94,
				frequency : 400
			},
			init : function (a, b) {
				return this._super(a, b),
				this.options.target.length ? (this.blocks = {}, this.blocks.main = this.options.target, this.blocks.image = this.blocks.main.find("img"), this.index = 0, this.interval = null, this.get_params(), void(this.options.play && this.play())) : !1
			},
			get_params : function () {
				_.isUndefined(this.blocks.main.data("picto-step-height")) || (this.options.step_height = parseInt(this.blocks.main.data("picto-step-height"), 10)),
				_.isUndefined(this.blocks.main.data("picto-steps-count")) || (this.options.steps_count = parseInt(this.blocks.main.data("picto-steps-count"), 10)),
				_.isUndefined(this.blocks.main.data("picto-frequency")) || (this.options.steps_count = parseInt(this.blocks.main.data("picto-frequency"), 10)),
				_.isUndefined(this.blocks.main.data("picto-auto-play")) || (this.options.loop = parseInt(this.blocks.main.data("picto-loop"), 10)),
				_.isUndefined(this.blocks.main.data("picto-play")) || (this.options.play = parseInt(this.blocks.main.data("picto-play"), 10))
			},
			play : function () {
				var a = this;
				this.interval = window.setInterval(function () {
						a.next()
					}, this.options.frequency)
			},
			next : function () {
				this.index++,
				this.index >= this.options.steps_count && (this.options.loop ? this.index = 0 : this.stop()),
				this.render()
			},
			prev : function () {
				this.index--,
				this.index < 0 && (this.options.loop ? this.index = this.options.steps_count - 1 : this.stop()),
				this.render()
			},
			pause : function () {
				null !== this.interval && window.clearInterval(this.interval)
			},
			stop : function () {
				this.pause(),
				this.index = 0,
				this.render()
			},
			render : function () {
				var a = this.options.step_height * -this.index;
				if (Modernizr.csstransforms3d) {
					var b = Modernizr.prefixed("transform");
					this.blocks.image[0].style[b] = "translate3d(0," + a + "px,0)"
				} else
					TweenLite.set(this.blocks.image, {
						css : {
							top : this.options.step_height * -this.index
						}
					})
			}
		})
}
(), function (a) {
	"use strict";
	a.Funnel = Abstract.extend({
			defaults : {
				destination_position : "bottom",
				timeout_duration : 300
			},
			init : function (a, b) {
				this._super(a, b),
				this.active = !1,
				this.prevented = {},
				this.timeout = null,
				this.polygone = new Polygone(this),
				this.init_mouse(),
				this.options.debug && this.init_debug()
			},
			init_mouse : function () {
				var b = this;
				this.mouse = {},
				a.onmousemove = function (c) {
					var d = (c.clientX < b.mouse.x ? "left" : "right") !== b.mouse.direction;
					b.mouse.direction = c.clientX < b.mouse.x ? "left" : "right",
					b.mouse.x = c.clientX,
					b.mouse.y = c.clientY,
					b.timeout && a.clearTimeout(b.timeout),
					b.timeout = a.setTimeout(function () {
							b.end()
						}, b.options.timeout_duration),
					!b.active || b.polygone.is_point_inside(b.mouse) && !d || b.end()
				}
			},
			end : function () {
				this.active = !1,
				this.trigger_prevented(),
				this.prevented = {},
				this.timeout && a.clearTimeout(this.timeout),
				this.update_debug()
			},
			trigger_prevented : function () {
				this.prevented.element && this.prevented.element.length && this.prevented.event && this.prevented.event.length && this.prevented.polygone.is_point_inside(this.mouse) && this.prevented.element.trigger(this.prevented.event)
			},
			update_from_cursor_to_object : function (b) {
				if (!b.length)
					return !1;
				this.active = !0,
				this.prevented = {};
				var c = b.offset().top - a.scrollY,
				d = b.offset().left - a.scrollX,
				e = b.width();
				return this.polygone.set_coords([this.mouse.x, this.mouse.y, d + e, c, d, c]),
				this.update_debug(),
				this
			},
			prevent : function (b, c) {
				if (!this.active || "number" != typeof this.mouse.x || "number" != typeof this.mouse.y)
					return !1;
				if (this.polygone.is_point_inside(this.mouse)) {
					if ("undefined" != typeof b && b.length) {
						var d = b.offset().top - a.scrollY,
						e = b.offset().left - a.scrollX,
						f = b.width(),
						g = b.height();
						this.prevented.element = b,
						this.prevented.event = c,
						this.prevented.polygone = new Polygone(this, {
								coords : [e, d, e + f, d, e + f, d + g, e, d + g]
							})
					}
					return this.update_debug(),
					!0
				}
			},
			init_debug : function () {
				this.debug = {},
				this.debug.canvas = document.createElement("canvas"),
				this.debug.context = this.debug.canvas.getContext("2d"),
				this.debug.canvas.width = a.innerWidth,
				this.debug.canvas.height = a.innerHeight,
				this.debug.canvas.style.position = "fixed",
				this.debug.canvas.style.top = 0,
				this.debug.canvas.style.left = 0,
				this.debug.canvas.style.zIndex = 9999999,
				this.debug.canvas.style.pointerEvents = "none",
				a.onresize = function () {
					this.debug.canvas.width = a.innerWidth,
					this.debug.canvas.height = a.innerHeight
				},
				document.body.appendChild(this.debug.canvas),
				this.update_debug()
			},
			update_debug : function () {
				if ("undefined" == typeof this.debug)
					return !1;
				this.debug.context.clearRect(0, 0, this.debug.canvas.width, this.debug.canvas.height),
				this.debug.context.fillStyle = "rgba(255,255,255,0.2)",
				this.debug.context.fillRect(0, 0, this.debug.canvas.width, this.debug.canvas.height);
				var a = 0;
				if ("undefined" != typeof this.polygone.points && this.polygone.points.length && this.active) {
					for (this.debug.context.beginPath(), this.debug.context.moveTo(this.polygone.points[0].x, this.polygone.points[0].y), a = 1; a < this.polygone.points.length; a++)
						this.debug.context.lineTo(this.polygone.points[a].x, this.polygone.points[a].y);
					this.debug.context.fillStyle = "rgba(255,0,0,0.3)",
					this.debug.context.fill()
				}
				if ("undefined" != typeof this.prevented.polygone && "undefined" != typeof this.prevented.polygone.points && this.prevented.polygone.points.length && this.active) {
					for (this.debug.context.beginPath(), this.debug.context.moveTo(this.prevented.polygone.points[0].x, this.prevented.polygone.points[0].y), a = 1; a < this.prevented.polygone.points.length; a++)
						this.debug.context.lineTo(this.prevented.polygone.points[a].x, this.prevented.polygone.points[a].y);
					this.debug.context.fillStyle = "rgba(0,255,0,0.3)",
					this.debug.context.fill()
				}
			}
		})
}
(window), function (a) {
	"use strict";
	a.Polygone = Abstract.extend({
			defaults : {
				coords : []
			},
			init : function (a, b) {
				this._super(a, b),
				this.points = [],
				this.set_coords(this.options.coords)
			},
			set_coords : function (a) {
				if (a.length && a.length >= 6 && a.length % 2 === 0) {
					this.points = [];
					for (var b = 0; b < a.length; b += 2)
						this.points.push({
							x : parseInt(a[b], 10),
							y : parseInt(a[b + 1], 10)
						})
				}
				return this
			},
			is_point_inside : function (a) {
				if ("object" != typeof a || "number" != typeof a.x || "number" != typeof a.y || !this.points.length)
					return !1;
				for (var b = {}, c = {}, d = {
						a : {
							x : 0,
							y : 0
						},
						b : {
							x : 0,
							y : 0
						}
					}, e = 0, f = 0; f < this.points.length; f++)
					if (b = this.points[f], c = f === this.points.length - 1 ? this.points[0] : this.points[f + 1], d.a.x = c.x - b.x, d.a.y = c.y - b.y, d.b.x = a.x - b.x, d.b.y = a.y - b.y, e = d.a.x * d.b.y - d.a.y * d.b.x, 0 > e)
						return !1;
				return !0
			}
		})
}
(window), function (a) {
	"use strict";
	a.Page = Abstract.extend({
			defaults : {
				is_tablet : !1,
				auto_scroll_delay : 5e3
			},
			init : function (a, b) {
				this._super(a, b),
				this.options.anchor_class = "anchor",
				this.options.anchored_class = "anchored",
				this.options.anchor_offset = 125,
				this.content = $(".page"),
				this.name = "default",
				this.init_pictos(),
				this.init_blocks(),
				this.init_anchors(),
				this.init_more(),
				this.trigger("init")
			},
			init_auto_scroll : function () {
				var b = this;
				this.auto_scroll = {},
				this.auto_scroll.timeout = null,
				a.onclick = function () {
					a.onclick = null,
					a.onmousewheel = null,
					b.prevent_auto_scroll()
				},
				a.onmousewheel = function () {
					a.onclick = null,
					a.onmousewheel = null,
					b.prevent_auto_scroll()
				},
				b.auto_scroll.timeout = a.setTimeout(function () {
						b.trigger("delay_scroll_passed")
					}, b.options.auto_scroll_delay)
			},
			prevent_auto_scroll : function () {
				"undefined" != typeof this.auto_scroll && this.auto_scroll.timeout && a.clearTimeout(this.auto_scroll.timeout)
			},
			init_pictos : function () {
				var a = this;
				$(".block .animated-picto").each(function () {
					new Animated_Picto(a, {
						target : $(this),
						play : !0
					})
				}),
				$(".top-of-page").each(function () {
					var b = $(this),
					c = b.find(".animated-picto"),
					d = new Animated_Picto(a, {
							target : c,
							play : a.options.is_tablet
						});
					b.on("mouseenter mouseleave", function (a) {
						"mouseenter" === a.type || "mouseover" === a.type ? d.play() : d.stop()
					})
				})
			},
			init_more : function () {
				var a = this;
				this.more = {},
				this.more.blocks = {},
				this.more.blocks.main = $("section.more"),
				this.more.blocks.main.length && (this.more.blocks.items = this.more.blocks.main.find(".item"), this.more.blocks.items.on("mouseenter", function () {
						var b = $(this);
						TweenLite.to(a.more.blocks.items.not(b), .3, {
							css : {
								autoAlpha : .5
							}
						}),
						TweenLite.to(b, 1, {
							css : {
								autoAlpha : 1
							}
						})
					}), this.more.blocks.main.on("mouseleave", function () {
						TweenLite.to(a.more.blocks.items, .3, {
							css : {
								autoAlpha : 1
							}
						})
					}))
			},
			init_blocks : function () {
				$("section.blocks").length && (this.sblocks = new Blocks(this, {
							target : $("section.blocks"),
							retina : this.options.retina
						}), this.init_auto_scroll())
			},
			init_anchors : function () {
				var b = this;
				this.content.find("a." + this.options.anchor_class + ":not(." + this.options.anchored_class + ")").on("click touchstart", function () {
					var c = $(this),
					d = c.attr("href");
					return _.isUndefined(d) || "" === d || (d = $(d), d.length ? TweenLite.to(a, .6, {
							scrollTo : {
								y : d.offset().top - b.options.anchor_offset
							}
						}) : TweenLite.to(a, .6, {
							scrollTo : {
								y : 0
							}
						})),
					!1
				}).addClass(this.options.anchor_class)
			},
			update : function (a) {
				_.isUndefined(this.sblocks) || this.sblocks.update(a),
				this.options.anchor_offset = a.height < 760 ? 105 : 125
			},
			destroy : function () {
				this.prevent_auto_scroll()
			}
		})
}
(window), function (a) {
	"use strict";
	a.Home = Page.extend({
			defaults : {
				is_tablet : !1,
				retracted_height : 125,
				retracted_height_responsive : 105,
				show_schedules : !0
			},
			init : function (b, c) {
				var d = this;
				this._super(b, c),
				this.content = $(".page"),
				this.name = "home",
				this.top = null,
				this.blocks = {},
				this.blocks.container = this.content.find("section.schedules-container"),
				this.schedules = new Schedules(this),
				a.setTimeout(function () {
					d.options.show_schedules && !d.schedules.shown && d.schedules.show(!0, !0)
				}, 101),
				this.schedules.on("update_top_image", function (a, b) {
					d.trigger("update_top_image", [a, b])
				})
			},
			update : function (a) {
				var b = 0;
				this.options.is_tablet || (b = a.height / 2 - (a.height < 760 ? this.options.retracted_height_responsive : this.options.retracted_height) / 2),
				0 > b && (b = 0),
				(typeof this.options.fixedTop == 'number'&&(b=this.options.fixedTop))
				this.top !== b && (this.blocks.container.css({
						top : b
					}), this.top = b)
			},
			destroy : function () {
				this._super(),
				this.schedules.destroy()
			}
		})
}
(window), function (a) {
	"use strict";
	a.News = Page.extend({
			defaults : {},
			init : function (a, b) {
				this._super(a, b),
				this.content = $(".page"),
				this.name = "news",
				this.content.find(".read-more").each(function () {
					var a = $(this),
					b = a.find(".link"),
					c = a.find("p"),
					d = 0;
					c.each(function () {
						d += $(this).height()
					}),
					b.on("click", function () {
						return TweenLite.to(b, .3, {
							css : {
								height : 0,
								padding : 0,
								opacity : 0
							}
						}),
						TweenLite.to(a, .3, {
							css : {
								height : d
							}
						}),
						!1
					})
				})
			}
		})
}
(window), function (a) {
	"use strict";
	a.Press = Page.extend({
			defaults : {},
			init : function (a, b) {
				var c = this;
				if (this._super(a, b), this.content = $(".page"), this.name = "press", this.blocks = {}, this.blocks.big_fish = this.content.find(".big-fish"), this.blocks.big_fish.length) {
					var d = this.blocks.big_fish.attr("src"),
					e = new Images;
					e.load(d, function () {
						TweenLite.to(c.blocks.big_fish, .6, {
							css : {
								autoAlpha : 1
							}
						})
					})
				}
			},
			update : function (a) {
				var b = 0;
				b = a.width > 1370 ? 0 : (-1370 + a.width) / 2,
				this.options.is_tablet && (b -= 40),
				TweenLite.set(this.blocks.big_fish, {
					css : {
						left : b
					}
				})
			}
		})
}
(window), function (a) {
	"use strict";
	a.Gallery = Page.extend({
			defaults : {
				mode : "grid",
				grid_image_width : 222,
				list_image_width : 556,
				grid_image_height : 125,
				list_image_height : 313
			},
			init : function (a, b) {
				var c = this;
				this._super(a, b),
				this.content = $(".page"),
				this.name = "gallery",
				this.blocks = {},
				this.blocks.modes_container = this.content.find(".modes"),
				this.blocks.modes = this.blocks.modes_container.find(".mode"),
				this.blocks.mode_grid = this.blocks.modes.filter(".grid"),
				this.blocks.mode_list = this.blocks.modes.filter(".list"),
				this.blocks.images = this.content.find(".images-container"),
				this.blocks.docs = this.content.find(".docs-container"),
				this.blocks.docs_button = this.content.find(".docs-button"),
				this.blocks.images_button = this.content.find(".images-button"),
				this.blocks.images_element = this.content.find(".images-element"),
				this.blocks.modes.on("click", function () {
					var a = $(this);
					c.blocks.modes.removeClass("active"),
					a.addClass("active"),
					a.hasClass("grid") && "grid" !== c.options.mode ? c.set_grid_mode() : a.hasClass("list") && "list" !== c.options.mode && c.set_list_mode()
				}),
				this.blocks.docs_button.on("click touch", function () {
					return $(this).hasClass("active") || c.show_docs_container(),
					!1
				}),
				this.blocks.images_button.on("click touch", function () {
					return $(this).hasClass("active") || c.show_images_container(),
					!1
				}),
				this.show_docs_container(!0)
			},
			show_images_container : function (a) {
				var b = this;
				"undefined" == typeof a && (a = !1),
				this.blocks.docs_button.removeClass("active"),
				this.blocks.images_button.addClass("active"),
				TweenLite.to(this.blocks.images_element, .2, {
					css : {
						autoAlpha : 1
					}
				}),
				a ? TweenLite.fromTo(b.blocks.images, .4, {
					css : {
						autoAlpha : 0,
						display : "block"
					}
				}, {
					css : {
						autoAlpha : 1
					}
				}) : TweenLite.fromTo(this.blocks.docs, .4, {
					css : {
						autoAlpha : 1,
						display : "block"
					}
				}, {
					css : {
						autoAlpha : 0
					},
					onComplete : function () {
						b.blocks.docs.css("display", "none"),
						TweenLite.fromTo(b.blocks.images, .4, {
							css : {
								autoAlpha : 0,
								display : "block"
							}
						}, {
							css : {
								autoAlpha : 1
							}
						})
					}
				})
			},
			show_docs_container : function (a) {
				var b = this;
				"undefined" == typeof a && (a = !1),
				this.blocks.images_button.removeClass("active"),
				this.blocks.docs_button.addClass("active"),
				TweenLite.to(this.blocks.images_element, .2, {
					css : {
						autoAlpha : 0
					}
				}),
				a ? TweenLite.fromTo(b.blocks.docs, .4, {
					css : {
						autoAlpha : 0,
						display : "block"
					}
				}, {
					css : {
						autoAlpha : 1
					}
				}) : TweenLite.fromTo(this.blocks.images, .4, {
					css : {
						autoAlpha : 1,
						display : "block"
					}
				}, {
					css : {
						autoAlpha : 0
					},
					onComplete : function () {
						b.blocks.images.css("display", "none"),
						TweenLite.fromTo(b.blocks.docs, .4, {
							css : {
								autoAlpha : 0,
								display : "block"
							}
						}, {
							css : {
								autoAlpha : 1
							}
						})
					}
				})
			},
			set_grid_mode : function () {
				var a = this;
				TweenLite.to(this.blocks.images, .4, {
					css : {
						alpha : 0
					},
					onComplete : function () {
						a.options.mode = "grid",
						a.blocks.images.removeClass("mode-list"),
						a.blocks.images.addClass("mode-grid"),
						TweenLite.to(a.blocks.images, .4, {
							css : {
								alpha : 1
							}
						})
					}
				})
			},
			set_list_mode : function () {
				var a = this;
				TweenLite.to(this.blocks.images, .4, {
					css : {
						alpha : 0
					},
					onComplete : function () {
						a.options.mode = "list",
						a.blocks.images.removeClass("mode-grid"),
						a.blocks.images.addClass("mode-list"),
						TweenLite.to(a.blocks.images, .4, {
							css : {
								alpha : 1
							}
						})
					}
				})
			}
		})
}
(window), function (a) {
	"use strict";
	a.Legal_Terms = Page.extend({
			defaults : {},
			init : function (a, b) {
				this._super(a, b),
				this.content = $(".page"),
				this.name = "legal-terms"
			}
		})
}
(window), function (a) {
	"use strict";
	a.Contact = Page.extend({
			defaults : {},
			init : function (a, b) {
				var c = this;
				this._super(a, b),
				this.content = $(".page"),
				this.name = "contact",
				this.init_form(),
				this.init_fishes(),
				this.content.find(".form").hasClass("active") ? this.show_form(!1) : this.show_intro(!1),
				this.content.find("a.email").on("click", function () {
					return c.show_form(),
					!1
				}),
				this.content.find(".close").on("click", function () {
					return c.show_intro(),
					!1
				})
			},
			show_intro : function (a) {
				var b = this;
				_.isUndefined(a) && (a = !0),
				a ? (TweenLite.set(this.content.find(".form"), {
						css : {
							display : "block"
						}
					}), TweenLite.to(this.content.find(".form"), .4, {
						css : {
							autoAlpha : 0
						},
						onComplete : function () {
							TweenLite.set(b.content.find(".form"), {
								css : {
									display : "none"
								}
							}),
							TweenLite.set(b.content.find(".intro"), {
								css : {
									display : "block"
								}
							}),
							TweenLite.to(b.content.find(".intro"), .4, {
								css : {
									autoAlpha : 1
								}
							})
						}
					})) : (TweenLite.set(b.content.find(".form"), {
						css : {
							autoAlpha : 0,
							display : "none"
						}
					}), TweenLite.set(b.content.find(".intro"), {
						css : {
							display : "block",
							autoAlpha : 1
						}
					}))
			},
			show_form : function (a) {
				var b = this;
				_.isUndefined(a) && (a = !0),
				a ? (TweenLite.set(this.content.find(".intro"), {
						css : {
							display : "block"
						}
					}), TweenLite.to(this.content.find(".intro"), .4, {
						css : {
							autoAlpha : 0
						},
						onComplete : function () {
							TweenLite.set(b.content.find(".intro"), {
								css : {
									display : "none"
								}
							}),
							TweenLite.set(b.content.find(".form"), {
								css : {
									display : "block"
								}
							}),
							TweenLite.to(b.content.find(".form"), .4, {
								css : {
									autoAlpha : 1
								}
							})
						}
					})) : (TweenLite.set(b.content.find(".intro"), {
						css : {
							autoAlpha : 0,
							display : "none"
						}
					}), TweenLite.set(b.content.find(".form"), {
						css : {
							display : "block",
							autoAlpha : 1
						}
					}))
			},
			init_fishes : function () {
				var a = this,
				b = new Images,
				c = 12,
				d = [],
				e = 0;
				for (this.fishes = {}, this.fishes.blocks = {}, this.fishes.blocks.main = this.content.find(".fishes"), this.fishes.blocks.items = [], this.fishes.displayed = [], this.fishes.last_displayed = [], this.fishes.groups = [[0, 1, 5], [2, 3, 4], [6, 7], [8, 9], [10, 11]]; c > e; e++)
					d.push(this.options.base_url + "/src/img/fishes/fish-" + (e + 1) + ".png");
				b.load(d, function () {
					var c = 0;
					_.each(b.images, function (b) {
						b = $(b),
						b.addClass("fish").addClass("fish-" + c++),
						a.fishes.blocks.items.push(b),
						a.fishes.blocks.main.append(b)
					}),
					a.fishes_animation()
				})
			},
			fishes_animation : function () {
				var b = this,
				c = Math.floor(Math.random() * this.fishes.groups.length),
				d = this.fishes.groups[c];
				-1 === _.indexOf(this.fishes.displayed, c) && c !== this.fishes.last_displayed && (this.fishes.displayed.push(c), _.each(d, function (a) {
						TweenLite.to(b.fishes.blocks.items[a], 1, {
							css : {
								autoAlpha : 1
							}
						})
					}));
				var e = function (a) {
					TweenLite.to(b.fishes.blocks.items[a], 1, {
						css : {
							autoAlpha : 0
						}
					})
				};
				a.setTimeout(function () {
					for (var a = 0; a < b.fishes.displayed.length; a++)
						b.fishes.displayed[a] === c && (b.fishes.last_displayed = c, b.fishes.displayed.splice(a, 1), _.each(d, e))
				}, Math.floor(5e3 * Math.random() + 6e3)),
				a.setTimeout(function () {
					b.fishes_animation()
				}, 3e3)
			},
			init_form : function () {
				this.form = {},
				this.form.blocks = {},
				this.form.blocks.main = this.content.find("form"),
				this.form.blocks.inputs_text = this.form.blocks.main.find("input[type=text]"),
				this.form.blocks.textarea = this.form.blocks.main.find("textarea"),
				this.form.blocks.select = this.form.blocks.main.find("select"),
				this.form.blocks.submit = this.form.blocks.main.find("input[type=submit]"),
				this.custom_checkbox(this.form.blocks.main.find("#element_optin")),
				this.custom_select(this.form.blocks.main.find("#element_subject")),
				this.form.blocks.submit.on("submit", function () {
					console.log("submit")
				}),
				this.form.blocks.inputs_text.add(this.form.blocks.textarea).filter(".error").on("focus", function () {
					var a = $(this);
					a.removeClass("error")
				})
			},
			custom_checkbox : function (a) {
				if (!a.length)
					return !1;
				var b = a.find("input[type=checkbox]"),
				c = $('<span class="fake-checkbox"><span class="inner"></span></span>');
				a.addClass("fake-checkbox-container"),
				a.append(c),
				b.prop("checked") && (a.addClass("checked"), c.addClass("checked")),
				a.on("click", function (d) {
					d.preventDefault(),
					b.prop("checked", !b.prop("checked")),
					b.prop("checked") ? (a.addClass("checked"), c.addClass("checked")) : (a.removeClass("checked"), c.removeClass("checked"))
				})
			},
			custom_select : function (a) {
				if (!a.length)
					return !1;
				var b = a.find("select"),
				c = b.find("option"),
				d = $('<span class="fake-select"></span>'),
				e = $('<span class="current"></span>'),
				f = $('<span class="list"></span>'),
				g = $('<span class="mask"></span>');
				a.addClass("fake-select-container"),
				d.append(g),
				d.append(e),
				d.append(f),
				a.append(d),
				c.each(function () {
					var a = $(this),
					b = $(this).text(),
					c = $(this).val();
					a.prop("selected") && ("" === a.val() && e.addClass("default"), e.text(b)),
					f.append('<span class="item" data-value="' + c + '">' + b + "</span>")
				}),
				b.hasClass("error") && d.addClass("error");
				var h = f.find(".item");
				h.on("click", function () {
					var a = $(this);
					c.removeAttr("selected"),
					c.eq(a.index()).attr("selected", "selected"),
					e.text(a.text()),
					g.css("display", "none"),
					"" === c.eq(a.index()).val() ? e.addClass("default") : e.removeClass("default"),
					TweenLite.set(f, {
						css : {
							display : "none"
						}
					})
				}),
				e.on("click", function (a) {
					a.preventDefault(),
					g.css("display", "block"),
					d.hasClass("error") && d.removeClass("error"),
					TweenLite.set(f, {
						css : {
							display : "block"
						}
					})
				}),
				g.on("click", function () {
					return g.css("display", "none"),
					TweenLite.set(f, {
						css : {
							display : "none"
						}
					}),
					!1
				})
			},
			update : function () {}

		})
}
(window), function (a) {
	"use strict";
	a.App = Abstract.extend({
			defaults : {
				ajax_class : "ajax",
				ajaxed_class : "ajaxed"
			},
			init : function (b, c) {
				var d = this;
				this._super(b, c),
				this.browser = new Browser(this, {
						disable_hover_on_scroll : !0,
						min_width : this.options.is_tablet ? null : 1e3
					}),
				this.keyboard = new Keyboard(this, {
						prevent : [38, 39, 40, 37]
					}),
				this.images = new Images(this),
				this.top = new Top(this),
				this.header = new Header(this, {
						is_tablet : this.options.is_tablet,
						fixedTop:this.options.fixedTop
					}),
				this.scroll_push = new Scroll_Push(this),
				this.retina = new Retina(this),
				this.music = new Music(this, {
						base_url : this.options.base_url,
						max_volume : "development" === this.options.env ? 0 : 1
					}),
				this.first_time_page = !0,
				this.scroll_home = $(".home-scroll"),
				this.init_page(this.options.page),
				this.init_events(),
				this.init_ajax(),
				this.init_history(),
				this.top.on("click", function () {
					d.scroll_push.blocks.main.trigger("click")
				}),
				a.setTimeout(function () {
					d.browser.trigger("scroll"),
					d.browser.trigger("resize"),
					d.header.show("home" === d.page.name)
				}, 30)
			},
			init_history : function () {
				var a = this;
				this.history = new Hashtory(this, {}),
				this.history.on("change", function (b) {
					"string" == typeof b && "" !== b && a.load_ajax_content(b)
				})
			},
			init_events : function () {
				var b = this;
				this.browser.on("resize", function () {
					b.header.update(b.browser),
					b.page.update(b.browser),
					b.top.update(b.browser),
					Modernizr.mq("only all") || b.set_media_queries()
				}),
				this.browser.on("scroll", function () {
					b.header.update(b.browser),
					b.page.update(b.browser),
					b.browser.top > 100 && "down" === b.browser.direction.y && b.scroll_push.set_active(!1)
				}),
				this.header.on("retract", function () {
					"home" !== b.page.name || b.page.schedules.shown || b.page.schedules.show(!0)
				}),
				this.header.on("expand", function () {
					"home" === b.page.name && b.page.schedules.hide(!0, b.browser.height < 760)
				}),
				this.scroll_push.on("click", function () {
					TweenLite.to(a, .6, {
						scrollTo : {
							y : b.browser.height - b.header.options.retracted_height
						}
					})
				}),
				this.keyboard.on("key_down", function (c) {
					var d = null,
					e = null,
					f = 0;
					if (38 === c ? d = "up" : 40 === c ? d = "down" : 39 === c ? d = "right" : 37 === c && (d = "left"), "up" === d || "down" === d)
						f = b.browser.height > 760 ? 125 : 105, $(".anchor-destination").each(function () {
							var a = $(this),
							c = a.offset().top;
							"down" === d && c - f > b.browser.top && null === e && (e = c),
							"up" === d && c - f < b.browser.top && (e = c)
						}), "up" === d && null === e && (e = top), null !== e && (f > 0 && (e -= f), TweenLite.to(a, .6, {
								scrollTo : {
									y : e
								}
							}));
					else {
						var g = b.header.blocks.pagination.items.filter(".active").find(".item.active"),
						h = null;
						g.length && ("left" === d ? h = g.find("a.prev") : "right" === d && (h = g.find("a.next")), h && h.length && h.trigger("click"))
					}
				}),
				this.header.on("handle_click", function () {
					"function" == typeof b.page.prevent_auto_scroll && b.page.prevent_auto_scroll()
				}),
				this.page.on("init", function () {
					"function" == typeof b.page.prevent_auto_scroll && b.page.prevent_auto_scroll()
				})
			},
			init_page : function (b) {
				var c = this;
				switch (this.first_time_page || this.page.destroy(), b) {
				case "index":
					if (b = new Home(this, {
								is_tablet : this.options.is_tablet,
								show_schedules : "open" !== this.options.header_open,
								fixedTop:this.options.fixedTop
							}), b.schedules.current_top) {
						var d = b.schedules.current_top;
						this.first_time_page ? this.top.set_image(d, !0, !1, !0) : this.top.set_image(d)
					}
					this.header.retract(!this.first_time_page),
					this.header.options.default_expanded = !1,
					this.scroll_push.set_active(!1),
					TweenLite.to(this.scroll_home, .3, {
						height : 46
					}),
					this.music.play(),
					b.off("update_top_image"),
					b.on("update_top_image", function (a, b) {
						"undefined" != typeof b && c.header.set_theme(b),
						"home" === c.page.name && c.top.set_image(a, !0, !0, !0, function () {
							c.page.schedules.go()
						})
					});
					break;
				case "legal-terms":
					b = new Legal_Terms(this),
					this.options.is_tablet || this.header.retract(!this.first_time_page),
					this.header.set_theme("dark"),
					this.header.options.default_expanded = !1,
					this.scroll_push.set_active(!1),
					TweenLite.to(this.scroll_home, .3, {
						height : 0
					}),
					this.top.retract(),
					this.music.pause(),
					this.music.desactivate();
					break;
				case "contact":
					b = new Contact(this, {
							base_url : this.options.base_url,
							is_tablet : this.options.is_tablet,
							retina : this.retina
						}),
					this.options.is_tablet || this.header.retract(!this.first_time_page),
					this.header.set_theme("dark"),
					this.header.options.default_expanded = !1,
					this.scroll_push.set_active(!1),
					TweenLite.to(this.scroll_home, .3, {
						height : 0
					}),
					this.top.retract(),
					this.music.pause(),
					this.music.desactivate();
					break;
				case "news":
					b = new News(this, {
							base_url : this.options.base_url
						}),
					this.options.is_tablet || this.header.retract(!this.first_time_page),
					this.header.set_theme("dark"),
					this.header.options.default_expanded = !1,
					this.scroll_push.set_active(!1),
					TweenLite.to(this.scroll_home, .3, {
						height : 0
					}),
					this.top.retract(),
					this.music.pause(),
					this.music.desactivate();
					break;
				case "press-and-partners":
					b = new Press(this, {
							is_tablet : this.options.is_tablet,
							retina : this.retina
						}),
					this.options.is_tablet || this.header.retract(!this.first_time_page),
					this.header.set_theme("dark"),
					this.header.options.default_expanded = !1,
					this.scroll_push.set_active(!1),
					TweenLite.to(this.scroll_home, .3, {
						height : 0
					}),
					this.top.retract(),
					this.music.pause(),
					this.music.desactivate();
					break;
				case "gallery":
					b = new Gallery(this, {}),
					this.options.is_tablet || this.header.retract(!this.first_time_page),
					this.header.set_theme("dark"),
					this.header.options.default_expanded = !1,
					this.scroll_push.set_active(!1),
					TweenLite.to(this.scroll_home, .3, {
						height : 0
					}),
					this.top.retract(),
					this.music.pause(),
					this.music.desactivate();
					break;
				case "error-404":
					b = new Page(this),
					this.options.is_tablet || this.header.retract(!this.first_time_page),
					this.header.set_theme("dark"),
					this.header.options.default_expanded = !1,
					this.scroll_push.set_active(!1),
					TweenLite.to(this.scroll_home, .3, {
						height : 0
					}),
					this.top.retract(),
					this.music.pause(),
					this.music.desactivate();
					break;
				default:
					b = new Page(this, {
							retina : this.retina,
							is_tablet : this.options.is_tablet
						}),
					this.options.is_tablet || this.header.retract(!this.first_time_page),
					this.header.options.default_expanded = !1,
					this.scroll_push.set_active(!0),
					TweenLite.to(this.scroll_home, .3, {
						height : 0
					}),
					this.music.pause(),
					this.music.desactivate()
				}
				"open" === this.options.header_open && (this.options.header_open = "default", this.header.options.default_expanded = !0, this.header.expanded || a.setTimeout(function () {
						c.header.expand()
					}, 101)),
				this.retina.add(),
				this.header.hide_mask(),
				this.page = b,
				this.first_time_page = !1,
				this.listen_to_ajax(),
				this.page.on("delay_scroll_passed", function () {
					c.browser.top <= 0 && c.scroll_push.blocks.main.trigger("click")
				})
			},
			init_ajax : function () {
				var a = this;
				this.ajax = {},
				this.ajax.container = $("section.page").first(),
				this.ajax.title = $("title").first(),
				this.ajax.current = null,
				this.on("ajax_click", function (b) {
					"string" == typeof b && "" !== b && a.history.push(b)
				}),
				this.header.on("ajax_click", function (b) {
					"string" == typeof b && "" !== b && a.history.push(b)
				})
			},
			listen_to_ajax : function (a) {
				_.isUndefined(a) && (a = $("body"));
				var b = this,
				c = a.find("." + this.options.ajax_class + ":not(." + this.options.ajaxed_class + ")");
				c.addClass(this.options.ajaxed_class),
				c.on("click touchstart", function () {
					return b.trigger("ajax_click", [$(this).attr("href")]),
					!1
				})
			},
			load_ajax_content : function (b, c) {
				var d = this;
				_.isUndefined(c) && (c = !0),
				null !== this.ajax.current && c && this.ajax.current.abort(),
				this.ajax.current = $.ajax({
						url : b,
						dataType : "json",
						data : "format=json",
						success : function (a) {
							d.insert_ajax_content(b, a)
						},
						error : function () {
							a.top.location.href = b
						}
					})
			},
			insert_ajax_content : function (b, c) {
				var d = this;
				"undefined" != typeof _gaq && _gaq.push(["_trackPageview", b]),
				TweenLite.to(this.ajax.container, .6, {
					css : {
						autoAlpha : 0
					},
					onComplete : function () {
						if ($("body").removeAttr("class").addClass($("body").data("permanent-class")).addClass("section-" + c.section).addClass("page-" + c.page), c.top_image) {
							var b = "undefined" == typeof c.top_image_theme ? "light" : c.top_image_theme;
							d.top.set_image(c.top_image),
							d.header.set_theme(b)
						} else
							d.top.retract();
						d.page && TweenLite.set(d.page.content, {
							css : {
								height : "auto"
							}
						}),
						d.ajax.container.html(c.html);
						try {
							d.ajax.title.text(c.seo.title)
						} catch (e) {}

						d.header.set_langs_urls(c.langs_urls),
						d.header.set_pagination(c.section, c.id),
						d.init_page(c.page),
						document.placeholderPolyfill(),
						TweenLite.to(d.ajax.container, .6, {
							css : {
								autoAlpha : 1
							}
						}),
						d.browser.trigger("resize"),
						TweenLite.to(a, .6, {
							scrollTo : {
								y : 0
							}
						})
					}
				})
			},
			set_media_queries : function () {
				var a = $("html");
				this.browser.width < 1280 ? a.hasClass("max-width-1280") || a.addClass("max-width-1280") : a.hasClass("max-width-1280") && a.removeClass("max-width-1280"),
				this.browser.width < 1130 ? a.hasClass("max-width-1130") || a.addClass("max-width-1130") : a.hasClass("max-width-1130") && a.removeClass("max-width-1130"),
				this.browser.height < 760 ? a.hasClass("max-height-760") || a.addClass("max-height-760") : a.hasClass("max-height-760") && a.removeClass("max-height-760")
			}
		})
}
(window);
