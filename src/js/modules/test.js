
let Test = {
	init() {
		setTimeout(() => window.find(`.categories li[data-id="themes"]`).trigger("click"), 200);
		// setTimeout(() => window.find(`.button[data-arg="ant:2048"]`).trigger("click"), 1000);
		// setTimeout(() => window.find(".reel-nav li:nth(1)").trigger("click"), 1000);
	}
};
