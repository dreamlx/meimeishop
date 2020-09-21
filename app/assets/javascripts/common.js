$(function() {
    $('#provider_main_category_id').change(function() {
        
      $.ajax({
        url: '/admin/providers/get_sub_category',
        type: 'GET',
        data: {
            main_category_id: $(this).val()
        },
        dataType:'json',
        headers: {
          'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
        },
        success: function(data) {
          $('#provider_sub_category_id').html("");
          var str = '';
          for (var i = 0; i < data.length; ++i) {
            str += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
          };
          $('#provider_sub_category_id').append(str);
        },
        error: function() {

        }
      });
    });
  });