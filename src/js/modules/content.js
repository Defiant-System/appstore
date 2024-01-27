
// appstore.content

{
	init() {
		// fast references
		this.els = {
			el: window.find(".content"),
		};
		// render start page
		this.dispatch({ type: "render-start" });
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
				break;
			case "render-content":
				if (event.category === "discover") {
					return Self.dispatch({ type: "render-start" });
				}
				// render content
				window.render({
					template: "category-list",
					match: `//Data/Apps`,
					changePath: "//xsl:for-each",
					changeSelect: `./*[@type='${event.category}']`,
					target: Self.els.el,
				});
				break;
		}
	}
}
