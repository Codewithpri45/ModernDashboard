document.addEventListener('DOMContentLoaded', function () {
    const sidebarToggle = document.getElementById('sidebarToggle');
    const mainSidebar = document.getElementById('sidebarNav');
    const pageContentWrapper = document.getElementById('pageContentWrapper');
    const sidebarMenuList = document.getElementById('sidebarMenuList');
    const sidebarCloseBtn = document.getElementById('sidebarCloseBtn');
    const sidebarSearch = document.getElementById('sidebarSearch');
    let overlay = document.getElementById('sidebarOverlay');
    if (!overlay) {
        overlay = document.createElement('div');
        overlay.id = "sidebarOverlay";
        document.body.appendChild(overlay);
    }

    let flyoutStates = []; // Track open flyouts at each level

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
        hideAllFlyouts();
        document.body.style.overflow = '';
    }

    function createFlyoutContainer(level) {
        let flyoutContainer = document.getElementById(`sidebarFlyoutContainer-level-${level}`);
        if (!flyoutContainer) {
            flyoutContainer = document.createElement('div');
            flyoutContainer.id = `sidebarFlyoutContainer-level-${level}`;
            flyoutContainer.className = 'sidebar-flyout-container';
            document.body.appendChild(flyoutContainer);
        }
        return flyoutContainer;
    }

    function showFlyout(targetContentId, anchorElement, level) {
        const flyoutContainer = createFlyoutContainer(level);
        const contentSourceDiv = document.getElementById(targetContentId);
        if (contentSourceDiv && flyoutContainer) {
            // Clear this level's flyout content
            flyoutContainer.innerHTML = '';
            const clonedContent = contentSourceDiv.cloneNode(true);
            clonedContent.classList.remove('d-none');
            clonedContent.classList.add(`flyout-level-${level}`);
            flyoutContainer.appendChild(clonedContent);

            // Get anchor's viewport position
            const anchorRect = anchorElement.getBoundingClientRect();

            // Use absolute positioning relative to viewport
            const absoluteTop = anchorRect.top;
            const absoluteLeft = anchorRect.right;

            // Position flyout
            flyoutContainer.style.top = `${absoluteTop}px`;
            flyoutContainer.style.left = `${absoluteLeft}px`;
            flyoutContainer.classList.add('active');

            // Update flyout state
            flyoutStates[level - 1] = { targetId: targetContentId, container: flyoutContainer };

            // Attach click events to any nested has-flyout links in this flyout
            const nestedFlyoutLinks = clonedContent.querySelectorAll('a.nav-link.has-flyout');
            nestedFlyoutLinks.forEach(link => {
                link.addEventListener('click', (e) => handleFlyoutClick(e, level + 1));
            });
        }
    }

    function hideFlyout(level) {
        const flyoutState = flyoutStates[level - 1];
        if (flyoutState && flyoutState.container) {
            flyoutState.container.classList.remove('active');
            flyoutState.container.innerHTML = '';
        }
        flyoutStates[level - 1] = null;
        const activeParents = document.querySelectorAll(`.flyout-level-${level} li.active-flyout-parent`);
        activeParents.forEach(li => li.classList.remove('active-flyout-parent'));
        const chevrons = document.querySelectorAll(`.flyout-level-${level} .flyout-indicator-icon`);
        chevrons.forEach(icon => icon.classList.remove('rotated'));
    }

    function hideAllFlyouts() {
        flyoutStates.forEach((_, index) => hideFlyout(index + 1));
        flyoutStates = [];
        const activeParents = document.querySelectorAll('li.active-flyout-parent');
        activeParents.forEach(li => li.classList.remove('active-flyout-parent'));
        const allChevrons = document.querySelectorAll('.flyout-indicator-icon');
        allChevrons.forEach(icon => icon.classList.remove('rotated'));
    }

    function handleFlyoutClick(e, level = 1) {
        e.preventDefault();
        const link = e.currentTarget;
        const parentLi = link.closest('li');
        const chevronIcon = link.querySelector('.flyout-indicator-icon');
        const targetFlyoutContentId = link.getAttribute('data-bs-target').substring(1);

        for (let i = level; i <= flyoutStates.length; i++) {
            hideFlyout(i);
        }

        const currentFlyout = flyoutStates[level - 1];
        if (currentFlyout && currentFlyout.targetId === targetFlyoutContentId) {
            hideFlyout(level);
            flyoutStates[level - 1] = null;  // clear state fully
            parentLi.classList.remove('active-flyout-parent');
            if (chevronIcon) chevronIcon.classList.remove('rotated');
            return; // exit function after hiding
        }

        else {
            const sameLevelLinks = link.closest('.flyout-submenu-content')
                ? link.closest('.flyout-submenu-content').querySelectorAll('a.nav-link.has-flyout')
                : sidebarMenuList.querySelectorAll(':scope > li > a.nav-link.has-flyout');
            sameLevelLinks.forEach(l => {
                const icon = l.querySelector('.flyout-indicator-icon');
                if (icon) icon.classList.remove('rotated');
                l.closest('li').classList.remove('active-flyout-parent');
            });

            parentLi.classList.add('active-flyout-parent');
            showFlyout(targetFlyoutContentId, link, level);
            if (chevronIcon) chevronIcon.classList.add('rotated');
        }
    }

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
            !flyoutStates.some(state => state && state.container.contains(event.target))
        ) {
            closeSidebar();
        }
    });

    if (sidebarMenuList) {
        const mainLevelLinks = sidebarMenuList.querySelectorAll('a.nav-link.has-flyout');
        mainLevelLinks.forEach(link => {
            link.addEventListener('click', (e) => handleFlyoutClick(e, 1));
        });

        const directLinks = sidebarMenuList.querySelectorAll('a.nav-link:not(.has-flyout)');
        directLinks.forEach(link => {
            link.addEventListener('click', function () {
                closeSidebar();
            });
        });
    }

    mainSidebar.addEventListener('transitionend', function () {
        if (!mainSidebar.classList.contains('active')) {
            hideAllFlyouts();
        }
    });

    document.addEventListener('mousedown', function (event) {
        if (
            !mainSidebar.contains(event.target) &&
            !flyoutStates.some(state => state && state.container.contains(event.target))
        ) {
            hideAllFlyouts();
        }
    });

    if (sidebarSearch && sidebarMenuList) {
        sidebarSearch.addEventListener('keyup', function () {
            const filter = sidebarSearch.value.trim().toUpperCase();
            const mainLis = sidebarMenuList.querySelectorAll(':scope > li');

            mainLis.forEach(li => {
                const mainAnchor = li.querySelector('a.nav-link');
                let mainText = mainAnchor ? (mainAnchor.textContent || mainAnchor.innerText).trim() : "";
                let matchFound = false;

                if (mainText.toUpperCase().includes(filter)) {
                    matchFound = true;
                }

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
