
@import "./modules/test.js";

const appstore = {
	init() {
		// init all sub-objects
		Object.keys(this)
			.filter(i => typeof this[i].init === "function")
			.map(i => this[i].init(this));

		// DEV-ONLY-START
		Test.init();
		// DEV-ONLY-END
	},
	dispatch(event) {
		let Self = appstore,
			name,
			pEl,
			el;
		// console.log(event);
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
					pEl = event.el.data("area") ? event.el : event.el.parents("div[data-area]");
					name = pEl.data("area");
					if (pEl.length && Self[name].dispatch) {
						Self[name].dispatch(event);
					}
				}
		}
	},
	sidebar: @import "./modules/sidebar.js",
	content: @import "./modules/content.js",
};

window.exports = appstore;
