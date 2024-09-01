
// appstore.content

{
	to: 5000,
	init() {
		// fast references
		this.els = {
			el: window.find(".content"),
		};
		// render start page
		this.dispatch({ type: "render-start" });

		// start timer
		this.timer = setTimeout(() => this.dispatch({ type: "hero-auto-step" }), this.to);
	},
	dispatch(event) {
		let APP = appstore,
			Self = APP.content,
			name,
			value,
			el;
		// console.log(event);
		switch (event.type) {
			case "render-start":
				// render content
				window.render({
					template: "start-page",
					match: `//Data`,
					target: Self.els.el,
				});
				// post-render fast references
				Self.els.reel = window.find(".reel-wrapper");
				Self.els.nav = window.find(".reel-nav");
				
				clearTimeout(Self.timer);
				Self.timer = setTimeout(() => Self.dispatch({ type: "hero-auto-step" }), Self.to);
				break;
			case "render-content":
				// render content
				switch (event.category) {
					case "discover":
						return Self.dispatch({ type: "render-start" });
					case "themes":
						window.render({
							template: "themes-list",
							match: `//Data/Themes`,
							target: Self.els.el,
						});
						break;
					default:
						window.render({
							template: "category-list",
							match: `//Data/Apps`,
							changePath: "//xsl:for-each",
							changeSelect: `./*[@type='${event.category}']`,
							target: Self.els.el,
						});
				}
				break;
			case "hero-auto-step":
				el = window.find(".reel-nav");
				if (!el.length) return;

				value = el.find("li.active").index() + 1;
				if (value >= el.find("li").length) value = 0;
				el.find("li").get(value).trigger("click");
				// auto trigger next
				clearTimeout(Self.timer);
				Self.timer = setTimeout(() => Self.dispatch({ type: "hero-auto-step" }), Self.to);
				break;
			case "hero-go":
				el = $(event.target);
				// update nav
				Self.els.nav.find(".active").removeClass("active");
				el.addClass("active");
				// update reel
				Self.els.reel.data({ show: el.index() });
				// auto trigger next
				clearTimeout(Self.timer);
				Self.timer = setTimeout(() => Self.dispatch({ type: "hero-auto-step" }), Self.to);
				break;
			case "select-theme":
				el = $(event.target);
				karaqu.shell(`gui -o ${el.data("id")}`);
				break;
		}
	}
}
