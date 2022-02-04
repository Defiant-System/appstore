
const starter = {
	init() {
		// fast references
		this.content = window.find("content");

		// render tree view
		window.render({
			template: "block-apps",
			match: `//Data/apps`,
			target: window.find(".block")
		});
	},
	dispatch(event) {
		let Self = starter,
			el;
		switch (event.type) {
			case "window.open":
				break;
			case "open-help":
				defiant.shell("fs -u '~/help/index.md'");
				break;
			case "open-app":
				el = $(event.target);
				defiant.shell(`win -o ${el.data("arg")}`);
				break;
		}
	}
};

window.exports = starter;
