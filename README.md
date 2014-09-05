# Fragments.js

Fragments.js makes updating HTML page fragments easier. Instead of rendering the whole page and
letting browser recompile the JavaScript and CSS, it replaces fragments of the current page
with fragments found in the AJAX response.


## Installation

Add `fragments.js` gem to your application's Gemfile:

```ruby
gem "fragments.js", github: "fs/fragments.js"
```

Require it in `application.js`:

```coffeescript
//= require fragments
```

## Usage

Add fragment to the page:

```erb
<%= form_for @comment, data: { remote: true, behavior: "fragments" } %>
  <%= f.textarea :message %>
  <%= f.submit "Post" %>
<% end %>

<%= render "discussion", comments: @comments %>
```

```erb
<%# _discussion.html.erb %>

<div class="discussion" data-fragment-id="discussion">
  <%= render comments %>
</div>
```

After creating comment respond with fragments:

```ruby
def create
  # ...
  @comment.save

  render "discussion", comments: @comments, layout: false
end
```

And then element with the corresponding `[data-fragment-id]` will be updated from AJAX response.
In our particular case discussion (comments list) will be updated.

## Integration with JavaScript Libraries

Fragments.js replaces fragment contents with the data from AJAX response.
That means that nodes on which you binded events on jQuery.ready no longer exist.
So most jQuery plugins will stop working in updated fragments.

In order to restore such functionality after updating fragments
reinitialize required plugins/libraries on `fragment:update` event:


```coffeescript
$("input[placeholder]").placeholder()
$(".acts-as-chosen").chosen()
$(".acts-as-datatable").dataTable()

$(document).on("fragment:update", (e, $newContent) ->
  $newContent.findAndFilter("input[placeholder]").placeholder()
  $newContent.findAndFilter(".acts-as-chosen").chosen()
  $newContent.findAndFilter(".acts-as-datatable").dataTable()
)
```

## Credits

Thanks to [Arthur Pushkin](https://github.com/4r2r) for his original work on this library.

Fragments.js is maintained by [Vasily Polovnyov](https://github.com/vast).
It was written by [Flatstack](http://www.flatstack.com) with the help of our
[contributors](https://github.com/fs/fragments.js/contributors).
