/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

$('main #breedSelect1').change(function (event){
    var breedSelect1 = $(this).val();
   
    
});


$('.show-password').click(function () {
    const type = $('[name="password"]').attr('type');
    if (type === 'password') {
        $('[name="password"]').attr('type', 'text');
        $(this).html('<i class="fa fa-eye-slash" aria-hidden="true"></i>');
    } else {
        $('[name="password"]').attr('type', 'password');
        $(this).html('<i class="fa fa-eye" aria-hidden="true"></i>');
    }
});
$('.show-re-password').click(function () {
    const type = $('[name="re-password"]').attr('type');
    if (type === 'password') {
        $('[name="re-password"]').attr('type', 'text');
        $(this).html('<i class="fa fa-eye-slash" aria-hidden="true"></i>');
    } else {
        $('[name="re-password').attr('type', 'password');
        $(this).html('<i class="fa fa-eye" aria-hidden="true"></i>');
    }
});
$('.input').focus(function () {
    $('.error-notification').css('visibility', 'hidden');
});
$(".form-login").validate({
    rules: {
        account: {
            required: true,
            regex: /^[^\s]+$/
        },
        password: {
            required: true
        }
    },
    messages: {
        account: {
            required: 'Vui lòng nhập tài khoản của bạn',
            regex: "Tài khoản không chứa khoảng trắng"
        },
        password: {
            required: 'Vui lòng nhập mật khẩu của bạn'
        }
    }
});
$(".form-register").validate({
    rules: {
        name: {
            required: true,
            maxlength: 30,
            regex: /^(?!\s)[\s\S]*$/
        },
        mobile: {
            required: true,
            regex: /^0([0-9]{9,10})$/
        },
        email: {
            required: true,
            email: true
        },
        account: {
            required: true,
            minlength: 5,
            regex: /^[^\s]+$/
        },
        password: {
            required: true,
            regex: /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/
        },
        're-password': {
            required: true,
            equalTo: "[name=password]"
        }
    },
    messages: {
        name: {
            required: 'Vui lòng nhập tên của bạn',
            maxlength: 'Không nhập quá 30 kí tự',
            regex: "Không nhập kí tự trắng đầu tiên"
        },
        mobile: {
            required: 'Vui lòng nhập điện thoại của bạn',
            regex: 'Vui lòng nhập đúng định dạng số điện thoại bắt đầu số 0 và có 10 số'
        },
        email: {
            required: 'Vui lòng nhập email',
            email: 'Vui lòng nhập đúng định dạng email'
        },
        account: {
            required: 'Vui lòng điền tên đăng nhập',
            minlength: 'Tên tài khoản phải có ít nhất 5 ký tự',
            regex: "Tài khoản không chứa khoảng trắng"
        },
        password: {
            required: 'Vui lòng nhập mật khẩu của bạn',
            regex: 'Mật khẩu phải có ít nhất 8 ký tự, bao gồm chữ hoa, chữ thường, số và ký tự đặc biệt'
        },
        're-password': {
            required: 'Vui lòng nhập mật khẩu của bạn',
            equalTo: 'Xác nhận mật khẩu không đúng'
        }
    }
});
$.validator.addMethod(
        "regex",
        function (value, element, regexp) {
            var re = new RegExp(regexp);
            return this.optional(element) || re.test(value);
        },
        "Vui lòng kiểm tra đầu vào của bạn"
        );

