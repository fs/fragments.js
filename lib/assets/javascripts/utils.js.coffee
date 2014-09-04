$.fn.findAndFilter = (query) ->
  @find(query).add(@filter(query))
