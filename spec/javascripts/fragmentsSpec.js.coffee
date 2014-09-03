describe "Fragments", ->
  beforeEach ->
    loadFixtures("page.html")
    @xhr =
      responseText: """
        <div data-fragment-id="top-level-fragment">
          Spartans! Ready your breakfast and eat hearty...
        </div>

        <div>
          <div data-fragment-id="nested-fragment">
            For tonight, we dine in hell!
          </div>
        </div>
        """

  describe "on ajax:complete on [data-behavior=fragments]", ->
    beforeEach ->
      @fragmentUpdateTriggerSpy = jasmine.createSpy("trigger")
      $(document).off("fragment:update").on("fragment:update", @fragmentUpdateTriggerSpy)
      $("#fragments-behavior-source").trigger("ajax:complete", @xhr)

    it "updates page fragments with top-level fragments found in response", ->
      expect($.trim($("#top-level-fragment").text())).toEqual("Spartans! Ready your breakfast and eat hearty...")

    it "updates page fragmens with nested fragments found in response", ->
      expect($.trim($("#nested-fragment").text())).toEqual("For tonight, we dine in hell!")

    it "triggers fragment:update event on updated elements", ->
      expect(@fragmentUpdateTriggerSpy).toHaveBeenCalled()
      expect(@fragmentUpdateTriggerSpy.calls.count()).toEqual(2)
