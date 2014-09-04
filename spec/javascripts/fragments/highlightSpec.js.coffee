describe "Highlighting updated fragments", ->
  beforeEach ->
    loadFixtures("page_with_nested_fragments.html")
    @xhr =
      responseText: """
        <div id="nested-fragment" data-fragment-id="nested-fragment" data-highlight>
          <div data-updated-at="1409893743">
            For tonight, we dine in hell!
          </div>

          <div data-updated-at="1409893800">
            Prepare for glory!
          </div>
        </div>
        """

  describe "on ajax:complete on [data-behavior=fragments]", ->
    beforeEach ->
      $("#fragments-behavior-source").trigger("ajax:complete", @xhr)

    it "adds .is-updated-fragment to newly added fragments", ->
      expect($.trim($(".is-updated-fragment").text())).toEqual("Prepare for glory!")
