// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

const closeModalListener = (element) => {
    let elementToObserve = element || 'modal-close-button'
    let closeButton = document.getElementById(elementToObserve)
    let modalElement = document.getElementById('modal')

    if (closeButton && modalElement) {
        closeButton.addEventListener('click', () => {
            modalElement.remove()
        })
    }
}

const stripeTokenHandler = (token) => {
    const form = document.getElementById('payment-form');
    const hiddenInput = document.createElement('input');
    hiddenInput.setAttribute('type', 'hidden');
    hiddenInput.setAttribute('name', 'stripeToken');
    hiddenInput.setAttribute('value', token.id);
    form.appendChild(hiddenInput);

    form.submit();
}

const initiateStripe = () => {
    // Create a Stripe client.
    const stripe = Stripe('pk_test_QicERB8w3kyqaYW3hUUQylRH');

    // Create an instance of Elements.
    const elements = stripe.elements();

    // Custom styling can be passed to options when creating an Element.
    // (Note that this demo uses a wider set of styles than the guide below.)
    const style = {
        base: {
            color: '#32325d',
            lineHeight: '18px',
            fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
            fontSmoothing: 'antialiased',
            fontSize: '16px',
            '::placeholder': {
                color: '#aab7c4'
            }
        },
        invalid: {
            color: '#fa755a',
            iconColor: '#fa755a'
        }
    };

    // Create an instance of the card Element.
    const card = elements.create('card', { style: style });

    // Add an instance of the card Element into the `card-element` <div>.
    card.mount('#card-element');

    // Handle real-time validation errors from the card Element.
    card.addEventListener('change', function (event) {
        const displayError = document.getElementById('card-errors');
        if (event.error) {
            displayError.textContent = event.error.message;
        } else {
            displayError.textContent = '';
        }
    });

    // Handle form submission.
    const form = document.getElementById('payment-form');
    form.addEventListener('submit', function (event) {
        event.preventDefault();

        stripe.createToken(card).then(function (result) {
            if (result.error) {
                // Inform the user if there was an error.
                var errorElement = document.getElementById('card-errors');
                errorElement.textContent = result.error.message;
            } else {
                // Send the token to your server.
                stripeTokenHandler(result.token);
            }
        });
    });
}

const stripeModalToggle = () => {
    const toggleButton = document.getElementById('subscription-cta')
    if (toggleButton) {
        toggleButton.addEventListener('click', () => {
            const modalSection = document.getElementById('stripe-modal')
            modalSection.style.display = ''
        })

    }
}

const hideModalListener = (element) => {
    let elementToObserve = element || 'modal-close-button'
    let closeButton = document.getElementById(elementToObserve)
    let modalSection = document.getElementById('stripe-modal')

    if (closeButton && modalSection) {
        closeButton.addEventListener('click', () => {
            modalSection.style.display = 'none'
        })
    }
}

document.addEventListener('turbolinks:load', () => {
    App.windowContent = document.getElementById('added_content')
    let stripeForm = document.getElementById('payment-form')
    if (stripeForm) {
        initiateStripe();
        stripeModalToggle();
        hideModalListener('cancel_modal');
    }
})
