package com.kamazoun.model;

public class UserSession {

		private Integer session_id;
		private Integer user_id;
		private String details;
		
		public Integer getSession_id() {
			return session_id;
		}
		public void setSession_id(Integer session_id) {
			this.session_id = session_id;
		}
		public Integer getUser_id() {
			return user_id;
		}
		public void setUser_id(Integer user_id) {
			this.user_id = user_id;
		}
		public String getDetails() {
			return details;
		}
		public void setDetails(String details) {
			this.details = details;
		}
}
