jQuery ->
	$("#q").autocomplete(
		source: "/products/autocomplete",
		minLength: 2
		)