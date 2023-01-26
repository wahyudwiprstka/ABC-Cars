<nav class="navbar navbar-expand-lg bg-white shadow-sm px-2 position-fixed fixed-top">
  <div class="container-fluid">
    <a class="navbar-brand ms-5 fw-bold" href="#">ABC Cars</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item ms-1">
          <a class="nav-link" href="${pageContext.request.contextPath}/">Home</a>
        </li>
        <li class="nav-item ms-1">
          <a class="nav-link" href="${pageContext.request.contextPath}/cars">Cars</a>
        </li>
        <li class="nav-item ms-1">
          <a class="nav-link" href="${pageContext.request.contextPath}/about-us">About Us</a>
        </li>
        <li class="nav-item ms-1">
          <a class="nav-link" href="${pageContext.request.contextPath}/contact-us">Contact Us</a>
        </li>
        <sec:authorize access="hasAnyRole('ROLE_USER', 'ROLE_ADMIN')" var="isAuthenticated()">
          <li class="nav-item ms-1">
            <a class="nav-link" href="${pageContext.request.contextPath}/post-car-list">Your Car</a>
          </li>
          <li class="nav-item ms-1">
            <a class="nav-link" href="${pageContext.request.contextPath}/bidding-list">Your Bid</a>
          </li>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_ADMIN')" var="isAuthenticated()">
          <li class="nav-item ms-1">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/user">Administration</a>
          </li>
        </sec:authorize>
      </ul>
      <div class="me-5">
        <sec:authorize access="isAnonymous()">
          <a href="${pageContext.request.contextPath}/login" class="text-white text-decoration-none"><button class="btn btn-primary mt-0">Login</button></a>
          <a href="${pageContext.request.contextPath}/registration" class="text-white text-decoration-none"><button class="btn btn-primary mt-0">Register</button></a>
        </sec:authorize>
        <div class="d-flex">
          <sec:authorize access="hasAnyRole('ROLE_USER', 'ROLE_ADMIN')" var="isAuthenticated()">
            <div>
              <a href="${pageContext.request.contextPath}/profile" class="btn btn-default p-0 me-2">
                <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png" id="profilePic">
              </a>
              <a href="${pageContext.request.contextPath}/logout"><button class="btn btn-primary">Logout</button></a>
            </div>
          </sec:authorize>
        </div>
      </div>
    </div>
  </div>
</nav>