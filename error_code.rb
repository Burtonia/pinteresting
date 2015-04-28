# app > views > pins > index.html.erb
<%= render 'pages/home' unless user_signed_in %> 

<div class="center">
  <%= will_paginate @posts, renderer: BootstrapPagination::Rails %>
</div>
