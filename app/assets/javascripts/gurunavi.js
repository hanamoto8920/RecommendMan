$(function () {
      $("#testButton").click( function() {
       $('#js-rest').empty()
        // テキストボックスのデータを取得します
        var getData = $("#gurunavitext").val();
        // 取得値をメッセージで表示します
        // alert( getData );
        const url = "https://api.gnavi.co.jp/RestSearchAPI/v3/";
        const params = {
          keyid: "f39ec90a1de6bfa1f5e9eb9a1586eb70",
          name: getData
        };
        $('#js-rest').on('click', '.rest', function(){
          var rest = $(this).data()
           $("#shop_name").val(rest.name);
          $("#shop_url").val(rest.url);
          $("#shop_opentime").val(rest.opentime);
          $("#shop_address").val(rest.address);
          $("#shop_category").val(rest.category);
        })

      　$.getJSON( url, params, result => {
          result.rest.forEach(function(r) {
            $('#js-rest').append('<div class="rest" data-name="'+ r.name  + '" data-url="' + r.url + '" data-opentime="'+ r.opentime  + '" data-address="' + r.address + '" data-category="' + r.category + '">' + r.name + '</div>')
          })
        });
''
      });
    })