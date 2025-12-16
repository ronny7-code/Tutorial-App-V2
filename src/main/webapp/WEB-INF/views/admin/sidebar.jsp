 <%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
 <!DOCTYPE html>

 <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/admin/home">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">eLearning Admin <sup>2</sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/home">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>

            <!-- Nav Item - Course Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>Course/Category</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Course Category:</h6>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/admin/category/add">Add New Category</a>
                         <a class="collapse-item" href="${pageContext.request.contextPath}/admin/course/add">Add New Course</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Admin Related -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>Admin</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                      <h6 class="collapse-header">Admin Related:</h6>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/admin/add">Add New Admin</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Addons
            </div>

           <!-- Nav Item - Content Menu -->
           <li class="nav-item">
               <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseContent"
                  aria-expanded="true" aria-controls="collapseContent">
                   <i class="fas fa-fw fa-folder"></i>
                   <span>Content</span>
               </a>
               <div id="collapseContent" class="collapse" aria-labelledby="headingContent" data-parent="#accordionSidebar">
                   <div class="bg-white py-2 collapse-inner rounded">
                       <h6 class="collapse-header">Content Related:</h6>
                       <a class="collapse-item" href="${pageContext.request.contextPath}/admin/content/add">Add New Content</a>
                   </div>
               </div>
           </li>

           <!-- Nav Item - Instructor Menu -->
           <li class="nav-item">
               <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseInstructor"
                  aria-expanded="true" aria-controls="collapseInstructor">
                   <i class="fas fa-fw fa-chalkboard-teacher"></i>
                   <span>Instructor</span>
               </a>
               <div id="collapseInstructor" class="collapse" aria-labelledby="headingInstructor" data-parent="#accordionSidebar">
                   <div class="bg-white py-2 collapse-inner rounded">
                       <h6 class="collapse-header">Instructor Related:</h6>
                       <a class="collapse-item" href="${pageContext.request.contextPath}/admin/instructor/add">Add New Instructor</a>
                   </div>
               </div>
           </li>

          <!-- Nav Item - Message Menu -->
          <li class="nav-item">
              <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseMessage"
                 aria-expanded="true" aria-controls="collapseMessage">
                  <i class="fas fa-fw fa-envelope"></i>
                  <span>Message</span>
              </a>
              <div id="collapseMessage" class="collapse" aria-labelledby="headingMessage" data-parent="#accordionSidebar">
                  <div class="bg-white py-2 collapse-inner rounded">
                      <h6 class="collapse-header">Messages from the Users:</h6>
                      <a class="collapse-item" href="${pageContext.request.contextPath}/admin/contact/message">See Messages</a>
                  </div>
              </div>
          </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

        </ul>