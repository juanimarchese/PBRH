<script type="text/javascript">
    /*$( window ).load(function (){*/
    function submitForm() {
        $.validator.addMethod(
                "caracter",
                function (value, element, regexp) {
                    var re = new RegExp(regexp);
                    return this.optional(element) || re.test(value);
                },
                "Ingrese una letra mayuscula"
        );

        $.validator.addMethod(
                "numero",
                function (value, element, regexp) {
                    var re = new RegExp(regexp);
                    return this.optional(element) || re.test(value);
                },
                "Ingrese un número"
        );

        $.validator.addMethod(
                "hora",
                function (value, element, regexp) {
                    var re = new RegExp(regexp);
                    return this.optional(element) || re.test(value);
                },
                "El formato debe ser HH:mm (HH: [00-23],mm: [00-59])  Ej: 12:15, 05:05"
        );

        $.validator.addMethod(
                "idHecho",
                function (value, element, regexp) {
                    var re = new RegExp(regexp);
                    return this.optional(element) || re.test(value);
                },
                "El formato debe ser Numero/Año, Ej: 1/2014"
        );

        $("#form").validate();
        $("#form .required").each(function (item) {
            $(this).rules("add", {
                required: true
            });
        });
        $("#idHecho").rules("add", {
            idHecho: "^[0-9]+\/[0-9]{4}$"
        });

        $("#form .hora").each(function (item) {
            $(this).rules("add", {
                hora: "^([0-1][0-9]|2[0-3]):[0-5][0-9]$"
            });
        });

        $("#form .caracter").each(function (item) {
            $(this).rules("add", {
                caracter: "^[A-Z]$"
            });
        });

        $("#form .numero").each(function (item) {
            $(this).rules("add", {
                numero: "^[0-9]+$"
            });
        });


        $("#form .datepicker").each(function (item) {
            $(this).attr('readonly', 'readonly');
            $(this).addClass("readOnlyDP");
        });

        $("#form").submit();
    }
    /*});*/
</script>