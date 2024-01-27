
@import "./modules/test.js";

const appstore = {
	init() {
		// fast references
		this.content = window.find("content");

		// init all sub-objects
		Object.keys(this.box)
			.filter(i => typeof this.box[i].init === "function")
			.map(i => this.box[i].init(this));

		// render content view
		window.render({
			template: "block-apps",
			match: `//Data/Apps`,
			target: window.find(".block")
		});
	},
	dispatch(event) {
		let Self = appstore,
			name,
			pEl,
			el;
		switch (event.type) {
			case "open-help":
				karaqu.shell("fs -u '~/help/index.md'");
				break;
			case "open-app":
				el = $(event.target);
				karaqu.shell(`win -o ${el.data("arg")}`);
				break;
			default:
				if (event.el) {
					pEl = event.el.parents("div[data-box]");
					name = pEl.data("box");
					if (pEl.length && Self.box[name].dispatch) {
						Self[name].dispatch(event);
					}
				}
		}
	},
	sidebar: @import "./modules/sidebar.js",
	content: @import "./modules/content.js",
};

window.exports = appstore;
