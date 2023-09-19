/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


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
<<<<<<< HEAD
$('.input').focus(function () {
    $('.error-notification').css('visibility', 'hidden');
});
$(".form-login").validate({
    rules: {
        account: {
            required: true
        },
        password: {
            required: true
=======
$(".form-login").validate({
    rules: {
        account: {
            required: true,
            minlength: 5
        },
        password: {
            required: true,
            regex: /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/
>>>>>>> ccf0256ee7b0b5099143a1e6106dc727a7030bcb
        }
    },
    messages: {
        account: {
<<<<<<< HEAD
            required: 'Please enter your account'
        },
        password: {
            required: 'Please enter your password'   
=======
            required: 'Please enter your account',
            minlength: 'Password must be at least 5 characters'
        },
        password: {
            required: 'Please enter your password',
            regex: 'Password must be at least 8 characters, including uppercase letters, lowercase letters, numbers and special characters'
>>>>>>> ccf0256ee7b0b5099143a1e6106dc727a7030bcb
        }
    }
});
$(".form-register").validate({
    rules: {
        name: {
            required: true
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
            minlength: 5
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
            required: 'Please enter your name'
        },
        mobile: {
            required: 'Please enter your phone',
            regex: 'Please enter the correct phone number format(10,11)'
        },
        email: {
            required: 'Please enter your email',
            email: 'Please enter the correct email format'
        },
        account: {
            required: 'Please enter your user name',
            minlength: 'Password must be at least 5 characters'
        },
        password: {
            required: 'Please enter your password',
            regex: 'Password must be at least 8 characters, including uppercase letters, lowercase letters, numbers and special characters'
        },
        're-password': {
            required: 'Please enter your password',
            equalTo: 'Re-password incorrect'
        }
    }
});
$.validator.addMethod(
        "regex",
        function (value, element, regexp) {
            var re = new RegExp(regexp);
            return this.optional(element) || re.test(value);
        },
        "Please check your input."
        );

