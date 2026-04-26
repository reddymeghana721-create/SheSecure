const API_ROOT = '/api/users';

function setCurrentUser(user) {
  localStorage.setItem('shesecureUser', JSON.stringify(user));
}

function getCurrentUser() {
  return JSON.parse(localStorage.getItem('shesecureUser'));
}

function clearCurrentUser() {
  localStorage.removeItem('shesecureUser');
}

async function apiRegisterUser(user) {
  const res = await fetch(`${API_ROOT}/register`, {
    method: 'POST',
    headers: {'Content-Type': 'application/json'},
    body: JSON.stringify(user)
  });

  if (!res.ok) throw new Error("Register failed");
  return await res.json();
}

async function apiLoginUser(email, password) {
  const res = await fetch(`${API_ROOT}/login`, {
    method: 'POST',
    headers: {'Content-Type': 'application/json'},
    body: JSON.stringify({ email, password })
  });

  if (!res.ok) throw new Error("Login failed");
  return await res.json();
}

function requireLogin() {
  const user = getCurrentUser();
  if (!user || !user.id) {
    window.location.href = 'login.html';
    return null;
  }
  return user;
}

function logout() {
  clearCurrentUser();
  window.location.href = 'login.html';
}
// LOAD CONTACTS
async function loadContacts() {
  const res = await fetch(`/api/contacts/${currentUser.id}`);
  const contacts = await res.json();

  const list = document.getElementById("contactList");
  list.innerHTML = "";

  contacts.forEach(c => {
    const li = document.createElement("li");
    li.innerHTML = `${c.name} - ${c.phone} 
      <button onclick="deleteContact(${c.id})">❌</button>`;
    list.appendChild(li);
  });
}

// ADD CONTACT
async function addContact() {
  const name = document.getElementById("contactName").value;
  const phone = document.getElementById("contactPhone").value;

  if (!name || !phone) {
    alert("Fill all fields");
    return;
  }

  await fetch("/api/contacts", {
    method: "POST",
    headers: {"Content-Type": "application/json"},
    body: JSON.stringify({
      userId: currentUser.id,
      name: name,
      phone: phone
    })
  });

  loadContacts();
}

// DELETE CONTACT
async function deleteContact(id) {
  await fetch(`/api/contacts/${id}`, {
    method: "DELETE"
  });

  loadContacts();
}

// LOAD ON PAGE START
loadContacts();