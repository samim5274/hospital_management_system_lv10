function slideToggle(t,e,o){0===t.clientHeight?j(t,e,o,!0):j(t,e,o)}function slideUp(t,e,o){j(t,e,o)}function slideDown(t,e,o){j(t,e,o,!0)}function j(t,e,o,i){void 0===e&&(e=400),void 0===i&&(i=!1),t.style.overflow="hidden",i&&(t.style.display="block");var p,l=window.getComputedStyle(t),n=parseFloat(l.getPropertyValue("height")),a=parseFloat(l.getPropertyValue("padding-top")),s=parseFloat(l.getPropertyValue("padding-bottom")),r=parseFloat(l.getPropertyValue("margin-top")),d=parseFloat(l.getPropertyValue("margin-bottom")),g=n/e,y=a/e,m=s/e,u=r/e,h=d/e;window.requestAnimationFrame(function l(x){void 0===p&&(p=x);var f=x-p;i?(t.style.height=g*f+"px",t.style.paddingTop=y*f+"px",t.style.paddingBottom=m*f+"px",t.style.marginTop=u*f+"px",t.style.marginBottom=h*f+"px"):(t.style.height=n-g*f+"px",t.style.paddingTop=a-y*f+"px",t.style.paddingBottom=s-m*f+"px",t.style.marginTop=r-u*f+"px",t.style.marginBottom=d-h*f+"px"),f>=e?(t.style.height="",t.style.paddingTop="",t.style.paddingBottom="",t.style.marginTop="",t.style.marginBottom="",t.style.overflow="",i||(t.style.display="none"),"function"==typeof o&&o()):window.requestAnimationFrame(l)})}

let sidebarItems = document.querySelectorAll('.sidebar-item.has-sub');
for(var i = 0; i < sidebarItems.length; i++) {
    let sidebarItem = sidebarItems[i];
	sidebarItems[i].querySelector('.sidebar-link').addEventListener('click', function(e) {
        e.preventDefault();
        
        let submenu = sidebarItem.querySelector('.submenu');
        if( submenu.classList.contains('active') ) submenu.style.display = "block"

        if( submenu.style.display == "none" ) submenu.classList.add('active')
        else submenu.classList.remove('active')
        slideToggle(submenu, 300)
    })
}

window.addEventListener('DOMContentLoaded', (event) => {
    var w = window.innerWidth;
    if(w < 1200) {
        document.getElementById('sidebar').classList.remove('active');
    }
});
window.addEventListener('resize', (event) => {
    var w = window.innerWidth;
    if(w < 1200) {
        document.getElementById('sidebar').classList.remove('active');
    }else{
        document.getElementById('sidebar').classList.add('active');
    }
});

document.querySelector('.burger-btn').addEventListener('click', () => {
    document.getElementById('sidebar').classList.toggle('active');
})
document.querySelector('.sidebar-hide').addEventListener('click', () => {
    document.getElementById('sidebar').classList.toggle('active');

})


// Perfect Scrollbar Init
if(typeof PerfectScrollbar == 'function') {
    const container = document.querySelector(".sidebar-wrapper");
    const ps = new PerfectScrollbar(container, {
        wheelPropagation: false
    });
}

// Scroll into active sidebar
document.querySelector('.sidebar-item.active').scrollIntoView(false)















// dignosis test sale calculation section ================================================


document.addEventListener('livewire:init', () => {
    Livewire.on('updateTotal', data => {
        const total = data.total ?? 0;
        document.getElementById('liveTotal').innerText = total;
        document.getElementById('hiddenTotal').value = total;
        document.getElementById('btnSave').disabled = total <= 0;
        sumNumbers();
    });
});

function sumNumbers() {
    const total = parseInt(document.getElementById('hiddenTotal').value) || 0;
    const received = parseInt(document.getElementById('num2').value) || 0;
    const discount = parseInt(document.getElementById('num3').value) || 0;
    const btnSave = document.getElementById('btnSave');
    const resultEl = document.getElementById('result');
    const range = 10000000;

    if (received < 0) return resultEl.textContent = "Error 401.", false;
    if (discount < 0) return alert("Discount not possible."), 0;
    if (received >= range) return resultEl.textContent = "Error! Amount out of range.", btnSave.disabled = true;

    const payable = total - discount;
    let due = payable - received;

    if (received > payable || due < 0) {
        resultEl.textContent = `Return: ${-due}/-`;
    } else if (discount === total) {
        resultEl.textContent = `Full Discount! : 0/-`;
    } else if (received === 0 && due > 0) {
        resultEl.textContent = `Full Due! : ${due}/-`;
    } else if (due === 0) {
        resultEl.textContent = `Full Paid: 0/-`;
    } else {
        resultEl.textContent = `Due: ${due}/-`;
    }

    btnSave.disabled = total <= 0;
}

// dignosis test sale calculation section ================================================