const menuButton = document.querySelector('.menu-toggle');
const nav = document.querySelector('.site-nav');

menuButton?.addEventListener('click', () => {
  const isOpen = nav.classList.toggle('open');
  menuButton.setAttribute('aria-expanded', String(isOpen));
});

nav?.querySelectorAll('a').forEach((link) => {
  link.addEventListener('click', () => {
    nav.classList.remove('open');
    menuButton?.setAttribute('aria-expanded', 'false');
  });
});

const filterButtons = document.querySelectorAll('.filter-button');
const projectCards = document.querySelectorAll('.project-grid > .project-card, .project-grid > .project-stack');

filterButtons.forEach((button) => {
  button.addEventListener('click', () => {
    const selected = button.dataset.filter;
    filterButtons.forEach((item) => {
      const active = item === button;
      item.classList.toggle('active', active);
      item.setAttribute('aria-pressed', String(active));
    });
projectCards.forEach((card) => {
      card.classList.toggle('is-hidden', selected !== 'all' && card.dataset.category !== selected);
    });
  });
});

const posterDialog = document.querySelector('#poster-lightbox');

document.querySelector('[data-poster-open]')?.addEventListener('click', () => {
  posterDialog?.showModal();
});

document.querySelector('[data-poster-close]')?.addEventListener('click', () => {
  posterDialog?.close();
});

posterDialog?.addEventListener('click', (event) => {
  if (event.target === posterDialog) posterDialog.close();
});

document.querySelector('#year').textContent = new Date().getFullYear();
