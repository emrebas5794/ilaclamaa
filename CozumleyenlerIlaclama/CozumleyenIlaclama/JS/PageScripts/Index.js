
//topMenuItems = [
//       {
//           icon: "fa fa-bell",
//           caption: "Bildirim",
//           onclick: function () {

//               $("#list").slideToggle(100)

//           }
//       },
//]

$(document).ready(function () {
    function a() {
        $.ajax({
            url: "../../Main/EmployeeNotification_GET",
            success: function (data) {
                var result = JSON.parse(data);
                console.log(result);
                $("#notificationList").dxList({
                    dataSource: result,
                    noDataText: 'Bildirim Yok',
                    onItemClick: function (rowData) {
                        bildirim = rowData.itemData;
                    },
                    itemTemplate: function (data, index) {
                        var tarih = data.GosterilecegiTarih;
                        var tar = tarih.split(":");
                        var result = $('<div>').data(data).addClass("list"),

                            c = $('<button>').attr('id', data.Id).addClass("btn btn-default chk");

                            r1 = $('<div>').addClass("h").html(data.Hizmet),
                            r2 = $('<div>').addClass("g").html(tar[0] + ":" + tar[1]),
                            r3 = $('<div>').addClass("ds").html(data.Ad),
                            r4 = $('<a>').addClass("ds").attr("href", "../../Main/Customer?Id=" + data.MusteriId).append(r3);

                        result.append(c).append(r1).append(r4).append(r2);
                        return result;
                    },
                });
            }
        });
    }

    setInterval(a, 3000);
});

$(document).on("click", ".chk", function () {
    var i = $('<span>').addClass("fa fa-check checkicon");
    $(this).append(i);
    var yet = DevExpress.data.query($("#notificationList").dxList('instance').option('items'))
           .filter([["Id", "=", $(this).attr('id')]]).toArray();
    $.ajax({
        url: "../../Main/EmployeeNotification_SET",
        data: {
            Id: yet[0].Id
        },
        success: function () {
            $(this).closest(".dx-list-item").slideUp(800);
        }
    });
});

