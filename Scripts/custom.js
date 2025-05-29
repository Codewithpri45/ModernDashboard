document.addEventListener('DOMContentLoaded', function () {
    const sidebarToggle = document.getElementById('sidebarToggle');
    const mainSidebar = document.getElementById('sidebarNav');
    const pageContentWrapper = document.getElementById('pageContentWrapper');
    const sidebarSearch = document.getElementById('sidebarSearch');
    const sidebarMenuList = document.getElementById('sidebarMenuList');
    const flyoutContainer = document.getElementById('sidebarFlyoutContainer');

    let currentlyOpenFlyoutTargetId = null;
    let isFlyoutClosing = false; // Flag to prevent race conditions with animations

    // --- Helper Functions ---
    function showFlyout(targetContentId) {
        if (isFlyoutClosing) return; // Prevent opening if a close animation is in progress

        const contentSourceDiv = document.getElementById(targetContentId);
        if (contentSourceDiv && flyoutContainer) {
            flyoutContainer.innerHTML = ''; // Clear previous content
            const clonedContent = contentSourceDiv.cloneNode(true);
            clonedContent.classList.remove('d-none');
            flyoutContainer.appendChild(clonedContent);

            //offsetHeight triggers reflow, ensuring CSS transition applies
            flyoutContainer.offsetHeight;
            flyoutContainer.classList.add('active');
            currentlyOpenFlyoutTargetId = targetContentId;
        }
    }

    function hideFlyout() {
        if (flyoutContainer && flyoutContainer.classList.contains('active')) {
            isFlyoutClosing = true;
            flyoutContainer.classList.remove('active');

            // Wait for CSS transition to complete before clearing content
            // Match this timeout to the transition duration in your CSS
            setTimeout(() => {
                flyoutContainer.innerHTML = '';
                isFlyoutClosing = false;
            }, 300); // Corresponds to 0.3s transition in CSS
        }
        currentlyOpenFlyoutTargetId = null; // Always reset this when hide is called
    }

    function updateActiveFlyoutParent(clickedLinkElement) {
        const mainLevelLinks = sidebarMenuList.querySelectorAll(':scope > li > a.nav-link');
        mainLevelLinks.forEach(link => {
            link.closest('li').classList.remove('active-flyout-parent');
        });
        if (clickedLinkElement) {
            clickedLinkElement.closest('li').classList.add('active-flyout-parent');
        }
    }

    // --- Event Listeners ---

    // 1. Main Sidebar Toggle (Hamburger Icon)
    if (sidebarToggle && mainSidebar && pageContentWrapper) {
        sidebarToggle.addEventListener('click', function () {
            const isActive = mainSidebar.classList.toggle('active');
            pageContentWrapper.classList.toggle('active', isActive);

            if (!isActive) { // If main sidebar is now closed
                hideFlyout();
                updateActiveFlyoutParent(null); // Clear active parent visuals
            } else {
                // If sidebar is opened, and a flyout was meant to be open, try to restore it
                if (currentlyOpenFlyoutTargetId) {
                    showFlyout(currentlyOpenFlyoutTargetId);
                    const parentLink = sidebarMenuList.querySelector(`a.nav-link[data-bs-target="#${currentlyOpenFlyoutTargetId}"]`);
                    updateActiveFlyoutParent(parentLink);
                } else {
                    // If no specific flyout, check if a default one needs to be shown (from active-flyout-parent class)
                    const defaultOpenParentLi = sidebarMenuList.querySelector('li.active-flyout-parent');
                    if (defaultOpenParentLi) {
                        const defaultOpenLink = defaultOpenParentLi.querySelector('a.has-flyout');
                        if (defaultOpenLink) {
                            const targetId = defaultOpenLink.getAttribute('data-bs-target').substring(1);
                            showFlyout(targetId);
                        }
                    }
                }
            }
        });
    }

    // 2. Clicks on Main Sidebar Menu Items
    if (sidebarMenuList) {
        const mainLevelLinks = sidebarMenuList.querySelectorAll(':scope > li > a.nav-link');

        mainLevelLinks.forEach(link => {
            link.addEventListener('click', function (e) {
                const parentLi = this.closest('li');

                // Case A: Clicked a direct link (no flyout)
                if (!this.classList.contains('has-flyout')) {
                    updateActiveFlyoutParent(this); // Mark this simple link's parent as active
                    hideFlyout();
                    // Allow default navigation
                    return;
                }

                // Case B: Clicked a flyout trigger link
                e.preventDefault(); // Prevent navigation for flyout triggers
                const targetFlyoutContentId = this.getAttribute('data-bs-target').substring(1);

                // If clicking the same link that's already open, close its flyout
                if (parentLi.classList.contains('active-flyout-parent') && currentlyOpenFlyoutTargetId === targetFlyoutContentId) {
                    hideFlyout();
                    parentLi.classList.remove('active-flyout-parent');
                } else {
                    // It's a new flyout or a different one from what's open
                    updateActiveFlyoutParent(this); // Update visuals for the new parent
                    showFlyout(targetFlyoutContentId);
                }
            });
        });
    }

    // 3. Sidebar Search Filter
    if (sidebarSearch && sidebarMenuList) {
        sidebarSearch.addEventListener('keyup', function () {
            const filter = sidebarSearch.value.toUpperCase();
            const mainLis = sidebarMenuList.querySelectorAll(':scope > li');

            let wasFlyoutOpenBeforeFilter = flyoutContainer.classList.contains('active');
            let openFlyoutTargetBeforeFilter = currentlyOpenFlyoutTargetId;

            mainLis.forEach(li => {
                const mainAnchor = li.querySelector('a.nav-link');
                let mainText = mainAnchor ? (mainAnchor.textContent || mainAnchor.innerText).trim() : "";
                let matchFound = false;

                if (mainText.toUpperCase().indexOf(filter) > -1) {
                    matchFound = true;
                }

                if (!matchFound && mainAnchor.classList.contains('has-flyout')) {
                    const flyoutContentId = mainAnchor.getAttribute('data-bs-target').substring(1);
                    const flyoutContentDiv = document.getElementById(flyoutContentId);
                    if (flyoutContentDiv) {
                        const subAnchors = flyoutContentDiv.querySelectorAll('a.nav-link');
                        subAnchors.forEach(subAnchor => {
                            let subText = (subAnchor.textContent || subAnchor.innerText).trim();
                            if (subText.toUpperCase().indexOf(filter) > -1) {
                                matchFound = true;
                            }
                        });
                    }
                }
                li.style.display = matchFound ? "" : "none";
            });

            // Handle flyout visibility during filtering
            if (filter.length > 0) {
                if (wasFlyoutOpenBeforeFilter) {
                    hideFlyout(); // Hide if filter is active
                }
            } else { // Filter is cleared
                // Restore previously open flyout if main sidebar is active
                if (mainSidebar.classList.contains('active') && openFlyoutTargetBeforeFilter) {
                    showFlyout(openFlyoutTargetBeforeFilter);
                    // Also restore visual active state on the parent
                    const parentLink = sidebarMenuList.querySelector(`a.nav-link[data-bs-target="#${openFlyoutTargetBeforeFilter}"]`);
                    updateActiveFlyoutParent(parentLink);

                } else if (openFlyoutTargetBeforeFilter) { // If main sidebar not active, still remember it
                    currentlyOpenFlyoutTargetId = openFlyoutTargetBeforeFilter;
                }
            }
        });
    }

    // --- Initial State Setup on Page Load ---
    function initializeSidebarState() {
        // Default open state for main sidebar (e.g., on larger screens)
        // This can be controlled by CSS or a localStorage preference if desired.
        // For now, let's assume it might start closed, user opens it.

        // If a main item is marked with 'active-flyout-parent' in HTML, open its flyout IF main sidebar is also active.
        const defaultOpenLi = sidebarMenuList.querySelector('li.active-flyout-parent');
        if (defaultOpenLi) {
            const defaultOpenLink = defaultOpenLi.querySelector('a.has-flyout');
            if (defaultOpenLink) {
                const targetId = defaultOpenLink.getAttribute('data-bs-target').substring(1);
                if (mainSidebar.classList.contains('active')) { // Only if main sidebar is already active
                    showFlyout(targetId);
                } else {
                    currentlyOpenFlyoutTargetId = targetId; // Remember for when main sidebar opens
                }
            }
        }
    }

    initializeSidebarState();

});
const logoutModalElement = document.getElementById('logoutConfirmModal');
if (logoutModalElement) {
    logoutModalElement.addEventListener('show.bs.modal', function (event) {
        // 'event.relatedTarget' is the button that triggered the modal
        // You could fetch user info or set it here if needed just before showing
        // For now, just an example if username needs refreshing
        const logoutUserNameSpan = document.getElementById('logoutUserName');
        if (logoutUserNameSpan) {
            // In a real app, get this from session/cookie or an API
            // For demo:
            // logoutUserNameSpan.textContent = 'Current User';
        }
    });
}