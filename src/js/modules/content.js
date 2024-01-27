
// appstore.content

{
	init() {
		// fast references
		this.els = {
			el: window.find(".content"),
		};

		// render content
		window.render({
			template: "block-apps",
			match: `//Data/Apps`,
			target: this.els.el.find(".block"),
		});

	},
	dispatch(event) {
		let APP = appstore,
			Self = APP.content,
			name,
			value,
			el;
		// console.log(event);
		switch (event.type) {
			case "toggle-content":
				break;
		}
	}
}
