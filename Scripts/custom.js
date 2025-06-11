document.addEventListener('DOMContentLoaded', function () {
    const sidebarToggle = document.getElementById('sidebarToggle');
    const mainSidebar = document.getElementById('sidebarNav');
    const pageContentWrapper = document.getElementById('pageContentWrapper');
    const sidebarMenuList = document.getElementById('sidebarMenuList');
    const flyoutContainer = document.getElementById('sidebarFlyoutContainer');
    const sidebarCloseBtn = document.getElementById('sidebarCloseBtn');
    const sidebarSearch = document.getElementById('sidebarSearch');
    let overlay = document.getElementById('sidebarOverlay');
    if (!overlay) {
        overlay = document.createElement('div');
        overlay.id = "sidebarOverlay";
        document.body.appendChild(overlay);
    }

    let currentlyOpenFlyoutTargetId = null;

    function openSidebar() {
        mainSidebar.classList.add('active');
        pageContentWrapper.classList.add('active');
        overlay.style.display = "block";
        setTimeout(() => { overlay.style.opacity = "1" }, 10);
        document.body.style.overflow = 'hidden';
    }
    function closeSidebar() {
        mainSidebar.classList.remove('active');
        pageContentWrapper.classList.remove('active');
        overlay.style.opacity = "0";
        setTimeout(() => { overlay.style.display = "none" }, 300);
        hideFlyout();
        document.body.style.overflow = '';
    }

    function showFlyout(targetContentId, anchorElement) {
        const contentSourceDiv = document.getElementById(targetContentId);
        if (contentSourceDiv && flyoutContainer) {
            flyoutContainer.innerHTML = '';
            const clonedContent = contentSourceDiv.cloneNode(true);
            clonedContent.classList.remove('d-none');
            flyoutContainer.appendChild(clonedContent);

            // Position flyout to the right of the anchorElement
            const anchorRect = anchorElement.getBoundingClientRect();
            flyoutContainer.style.top = `${anchorRect.top}px`;
            flyoutContainer.style.left = `${anchorRect.right}px`;
            flyoutContainer.classList.add('active');
            currentlyOpenFlyoutTargetId = targetContentId;
        }
    }

    function hideFlyout() {
        if (flyoutContainer && flyoutContainer.classList.contains('active')) {
            flyoutContainer.classList.remove('active');
            flyoutContainer.innerHTML = '';
        }
        currentlyOpenFlyoutTargetId = null;
        // Remove active highlight
        const activeParents = sidebarMenuList.querySelectorAll('li.active-flyout-parent');
        activeParents.forEach(li => li.classList.remove('active-flyout-parent'));
        // Also reset all chevrons
        const allChevrons = sidebarMenuList.querySelectorAll('.flyout-indicator-icon');
        allChevrons.forEach(icon => icon.classList.remove('rotated'));
    }

    // Sidebar open/close
    if (sidebarToggle) {
        sidebarToggle.addEventListener('click', function (e) {
            e.stopPropagation();
            if (mainSidebar.classList.contains('active')) {
                closeSidebar();
            } else {
                openSidebar();
            }
        });
    }
    if (sidebarCloseBtn) {
        sidebarCloseBtn.addEventListener('click', function (e) {
            e.stopPropagation();
            closeSidebar();
        });
    }
    overlay.addEventListener('click', function () {
        closeSidebar();
    });
    document.addEventListener('mousedown', function (event) {
        if (
            mainSidebar.classList.contains('active') &&
            !mainSidebar.contains(event.target) &&
            !sidebarToggle.contains(event.target) &&
            !flyoutContainer.contains(event.target)
        ) {
            closeSidebar();
        }
    });

    // Sidebar menu logic
    if (sidebarMenuList) {
        const mainLevelLinks = sidebarMenuList.querySelectorAll(':scope > li > a.nav-link');
        mainLevelLinks.forEach(link => {
            link.addEventListener('click', function (e) {
                const parentLi = this.closest('li');
                const chevronIcon = this.querySelector('.flyout-indicator-icon');
                // Reset all chevrons first
                mainLevelLinks.forEach(l => {
                    const icon = l.querySelector('.flyout-indicator-icon');
                    if (icon) icon.classList.remove('rotated');
                });

                if (!this.classList.contains('has-flyout')) {
                    // Direct link, close sidebar
                    closeSidebar();
                    return;
                }

                // Has flyout
                e.preventDefault();
                const targetFlyoutContentId = this.getAttribute('data-bs-target').substring(1);

                if (
                    parentLi.classList.contains('active-flyout-parent') &&
                    currentlyOpenFlyoutTargetId === targetFlyoutContentId
                ) {
                    hideFlyout();
                    parentLi.classList.remove('active-flyout-parent');
                    // Reset chevron for this
                    if (chevronIcon) chevronIcon.classList.remove('rotated');
                } else {
                    // Remove highlight from others
                    mainLevelLinks.forEach(l => l.closest('li').classList.remove('active-flyout-parent'));
                    parentLi.classList.add('active-flyout-parent');
                    showFlyout(targetFlyoutContentId, this);

                    // Rotate chevron for this
                    if (chevronIcon) chevronIcon.classList.add('rotated');
                }
            });
        });
    }

    // Hide flyout if sidebar closes
    mainSidebar.addEventListener('transitionend', function () {
        if (!mainSidebar.classList.contains('active')) {
            hideFlyout();
        }
    });

    // Hide flyout if clicking outside it and sidebar menu
    document.addEventListener('mousedown', function (event) {
        if (
            flyoutContainer.classList.contains('active') &&
            !flyoutContainer.contains(event.target) &&
            !mainSidebar.contains(event.target)
        ) {
            hideFlyout();
        }
    });

    // Sidebar Search Functionality
    if (sidebarSearch && sidebarMenuList) {
        sidebarSearch.addEventListener('keyup', function () {
            const filter = sidebarSearch.value.trim().toUpperCase();
            const mainLis = sidebarMenuList.querySelectorAll(':scope > li');

            mainLis.forEach(li => {
                // Check main link text
                const mainAnchor = li.querySelector('a.nav-link');
                let mainText = mainAnchor ? (mainAnchor.textContent || mainAnchor.innerText).trim() : "";
                let matchFound = false;

                if (mainText.toUpperCase().includes(filter)) {
                    matchFound = true;
                }

                // If not found in main, check flyout submenu items
                if (!matchFound && mainAnchor && mainAnchor.classList.contains('has-flyout')) {
                    const flyoutContentId = mainAnchor.getAttribute('data-bs-target').substring(1);
                    const flyoutContentDiv = document.getElementById(flyoutContentId);
                    if (flyoutContentDiv) {
                        const subAnchors = flyoutContentDiv.querySelectorAll('a.nav-link');
                        subAnchors.forEach(subAnchor => {
                            let subText = (subAnchor.textContent || subAnchor.innerText).trim();
                            if (subText.toUpperCase().includes(filter)) {
                                matchFound = true;
                            }
                        });
                    }
                }
                li.style.display = matchFound ? "" : "none";
            });
        });
    }
});