document.addEventListener('DOMContentLoaded', function() {
    // Initial setup - ensure the first section is expanded
    document.getElementById('organisationContent').classList.remove('collapsed');
});

function toggleSection(sectionId) {
    const contentElement = document.getElementById(sectionId + 'Content');
    const iconElement = document.getElementById(sectionId + 'Icon');
    
    if (contentElement.classList.contains('collapsed')) {
        contentElement.classList.remove('collapsed');
        iconElement.classList.remove('fa-chevron-down');
        iconElement.classList.add('fa-chevron-up');
    } else {
        contentElement.classList.add('collapsed');
        iconElement.classList.remove('fa-chevron-up');
        iconElement.classList.add('fa-chevron-down');
    }
}