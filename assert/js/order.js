// Sidebar submenu toggle
    const menuAccountMain = document.getElementById("menuAccountMain");
    const accountSubmenu = document.getElementById("accountSubmenu");

    if (menuAccountMain && accountSubmenu) {
        // Open submenu by default since we're on the address page
        accountSubmenu.classList.add("open");

        menuAccountMain.addEventListener("click", (e) => {
            e.preventDefault();
            accountSubmenu.classList.toggle("open");
        });
    }

    // Initial display
    displayAddresses();
