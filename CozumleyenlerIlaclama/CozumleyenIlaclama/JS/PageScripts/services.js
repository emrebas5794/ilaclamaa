var he1 = $("#h-e-1").dxSelectBox({ placeholder: 'Hizmet Grupları' }).dxSelectBox('instance');
var he2 = $("#h-e-2").dxSelectBox({ placeholder: 'Hizmetler' }).dxSelectBox('instance');
var he3 = $("#h-e-3").dxTextBox({placeholder: 'Hizmet  giriniz', valueChangeEvent: "keyup", onValueChanged: function (e) { he3.option("value", e.value.replace(/i/g, "İ").toUpperCase()) }, isValid: false }).dxTextBox('instance');
var he4 = $("#h-e-4").dxTextBox({ placeholder: 'Hizmet giriniz', valueChangeEvent: "keyup", onValueChanged: function (e) { he4.option("value", e.value.replace(/i/g, "İ").toUpperCase()) }, isValid: false }).dxTextBox('instance');

topMenuItems = [
       {
           icon: "fa fa-pencil",
           caption: "Hizmet İşlemleri",
           onclick: function () {
               $('#mdl-hi').modal('show');
               he1.reset();
               he2.reset();
               he3.reset();
               he4.reset();
           }
       }];


$(document).ready(function () {
    get_hizmetgrup();
    Services();
});

function get_hizmetgrup() {
    $.ajax({
        url: "../../Main/ServiceGroup_GET",
        success: function (data) {
            var result = JSON.parse(data);
            $("#h-e-1").dxSelectBox({
                dataSource: result,
                valueExpr: 'Id',
                displayExpr: 'HizmetGrup',
                onValueChanged: function () {
                    get_hizmet(he1.option("value"));
                }
            });
        }
    });
}
function get_hizmet(e) {
    $.ajax({
        url: "../../Main/Service_GET",
        type: "post",
        data: {
            HizmetGrupId: e
        },
        success: function (data) {
            var result = JSON.parse(data);
            $("#h-e-2").dxSelectBox({
                dataSource: result,
                valueExpr: 'Id',
                displayExpr: 'HizmetAdi'
            });
        }
    });
}
$(document).on("click", "#hizmetekle", function () {
    var text = he4.option("value");
    var grup = he1.option("value");
    if (grup == null) {
        swal({ title: "Hizmet  ekleme işlemi için lütfen hizmet grubu seçini", text: "Girmek istediğiniz ürün bir gruba dahil değilse ürün gruplarında diğer seçeneğini seçebilirsiniz", type: "warning", timer: 1000, showConfirmButton: false });
    }
    else {
        if (text == "") {
            swal({ title: "Hizmet  eklemek için lütfen boş bırakmayınız", type: "warning", timer: 1000, showConfirmButton: false });
        }
        else {
            $.ajax({
                url: "../../Main/Service_SET",
                type: "post",
                data: {
                    HizmetAdi: text,
                    HizmetGrupId: grup
                },
                success: function () {
                    get_hizmet(he1.option("value"));
                    he4.reset();
                    Services();
                }
            });

        }
    }

});
$(document).on("click", "#hizmetsil", function () {
    var secilenhizmet = he2.option("value");
    if (secilenhizmet == null) {
        swal({ title: "Hizmet  silmek için lütfen önce seçim yapınız", type: "warning", timer: 1000, showConfirmButton: false });
    }
    else {
        swal({ title: "Silmek istediğinize emin misiniz?", text: "Seçtiğiniz hizmet  silinecektir, geri dönüşü mümkün değildir!", type: "warning", showCancelButton: true, confirmButtonColor: "#DD6B55", confirmButtonText: "Onaylıyorum!", cancelButtonText: "Onaylamıyorum!", closeOnConfirm: false, closeOnCancel: false }, function (isConfirm) {
            if (isConfirm) {
                swal({ title: "Silindi!", text: "Hizmet  başarı ile silindi.", timer: 1000, showConfirmButton: false });
                $.ajax({
                    url: "../../Main/Service_DELETE",
                    data: {
                        Id: secilenhizmet
                    },
                    success: function () {
                        get_hizmet(he1.option("value"));
                        Services();
                    }
                });
            }
            else { swal({ title: "İşlem iptal Edildi", text: "Hizmet grubu silinmedi ", timer: 1000, showConfirmButton: false }); return; }
        });
    }
});
$(document).on("click", "#hizmetguncelle", function () {
    var secilenhizmetgrubu = he1.option("value");
    var secilenhizmet = he2.option("value");
    if (secilenhizmetgrubu == null) {
        swal({ title: "Hizmet  güncellemek için lütfen önce hizmet grubu seçiniz", type: "warning", timer: 1000, showConfirmButton: false });
    }
    else {
        if (secilenhizmet != null) {
            $("#hizmetguncellediv").css("display", "block");
        }
        else {
            swal({ title: "Hizmet  güncellemek için lütfen önce hizmet seçiniz", type: "warning", timer: 1000, showConfirmButton: false });
        }
    }

});

$(document).on("click", "#hizmetkaydet", function () {
    var text = he3.option("value");
    if (text == "") {
        swal({ title: "Hizmeti güncellemek için lütfen metin giriniz", type: "warning", timer: 1000, showConfirmButton: false });
    }
    else {
        var id = he2.option("value");
        $.ajax({
            url: "../../Main/Service_UPDATE",
            type: "post",
            data: {
                Id: id,
                HizmetAdi: text
            },
            success: function () {
                get_hizmet(he1.option("value"));
                $("#hizmetguncellediv").css("display", "none");
                he3.reset();
                Services();

            }
        });
    }


});

function Services(){
    $.ajax({
        url: "../../Main/Services_GET",
        type:"post",
        success: function (data) {
            var a = JSON.parse(data);
            $("#hizmetlergrid").dxDataGrid("instance").option("dataSource", a);
        }
    });
}


$("#hizmetlergrid").dxDataGrid({
    selection: {
        mode: 'single'
    },
    hoverStateEnabled: true,
    columns: [
        {
            dataField: 'HizmetGrup',
            caption: 'Hizmet Grubu'
        },
        {
            dataField: 'HizmetAdi',
            caption: 'Hizmetler'
        }],
    searchPanel: {
        visible: true,
        width: 240,
        placeholder: 'Ara...'
    },
    groupPanel: {
        visible: true
    },
    showBorders: true,
    headerFilter: {
        visible: true
    },
    filterRow: {
        visible: true,
        applyFilter: "auto"
    }
});
