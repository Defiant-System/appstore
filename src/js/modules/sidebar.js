
// appstore.sidebar

{
	init() {
		// fast references
		this.els = {
			el: window.find(".sidebar"),
		};

		// render sidebar
		window.render({
			template: "sidebar-categories",
			match: `//Data/Categories`,
			target: this.els.el
		});

	},
	dispatch(event) {
		let APP = appstore,
			Self = APP.sidebar,
			name,
			value,
			el;
		// console.log(event);
		switch (event.type) {
			case "select-category":
				el = $(event.target);
				if (el.nodeName() !== "li") return;

				Self.els.el.find("li.active").removeClass("active");
				el.addClass("active");
				break;
		}
	}
}
