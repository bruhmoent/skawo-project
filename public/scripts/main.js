// Function to check and replace text if it overflows the container
function checkAndReplaceText() {
    const navItems = document.querySelectorAll('.nav-item');
    const emojis = ['🌐', '🔎', '🔐', '🚪', '👋'];
    var replace = false;
    const isMobile = navigator.userAgentData.mobile;

    // Replace text with emojis for all items if any one of them overflows
    if (isMobile) {
        navItems.forEach((item, index) => {
            // Store the original text content before replacing
            if (!item.hasAttribute('data-original-text')) {
                item.setAttribute('data-original-text', item.textContent);
            }
            // Replace with emoji
            if (index < emojis.length) {
                item.textContent = emojis[index];
            }
        });
    } else {
        // Restore the original text content for all items if none of them overflow
        navItems.forEach((item) => {
            if (item.hasAttribute('data-original-text')) {
                item.textContent = item.getAttribute('data-original-text');
            }
        });
    }
}

// Call the function when the DOM is fully loaded
document.addEventListener('DOMContentLoaded', checkAndReplaceText);

// Add a listener for the window resize event
window.addEventListener('resize', checkAndReplaceText);
