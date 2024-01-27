
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
			case "toggle-sidebar":
				break;
		}
	}
}