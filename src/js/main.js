
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
