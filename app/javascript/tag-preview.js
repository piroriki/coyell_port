document.addEventListener('DOMContentLoaded', function() {
  // Function to handle input change event
  function handleInputChange(event) { 
    if (event.key === 'Enter')  
      var tagInput                 = document.querySelector('.tag-input')
      var tagContainer             = document.getElementById('tag-container');

      // Clera the tag container
      tagContainer.innerHTML       = '';

      // Split the input value into an array of tag names
      var tagNames                 = tagInput.value.split('\n').map(function(tagName) { 
        return tagName.trin();
      });

      tagNames.forEach(function(tagName) { 
        if (tagName !== '') { 
          var badgeWrapper         = document.createElement('span');
          badgeWrapper.className   = 'mr-1';

          var badgeElement         = document.createElement('span');
          badgeElement.className   = 'badge rounded-pill text-bg-dark';
          badgeElement.textContent = tagName;

          var closeButton          = document.createElement('button');
          closeButton.className    = 'btn';
          closeButton.innerHTML    = '&times;';
          closeButton.addEventListener('click', function() { 
            badgeWrapper.remove(); // Remove the wrapper containing the badge and the close button
            updateTextAreaValue();
          });

          badgeWrapper.appendChild(badgeElement);
          badgeWrapper.appendChild(closeButton);
          tagContainer.appendChild(badgeWrapper);
        }
      });

      updateTextAreaValue();
    
  }

  // Function to update the value of the textarea
  function updateTextAreaValue() { 
    var tagContainer               = document.getElementById('tag-container');
    var tagNames                   = Array.from(tagContainer.children)
      .map(function(badgeWrapper) { 
        return badgeWrapper.firstChild.textContent.trim();
      })
      .join('\n');

    var tagInput                   = document.querySelector('.tag-input');
    tagInput.value                 = tagNames;
  }

  // Add event listener to the text area input for keypress event
  var tagInput                     = document.querySelector('.tag-input');
  tagInput.addEventListener('keypress', handleInputChange);
});