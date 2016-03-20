package com.wodedata.web.viewmodel;

import com.wodedata.domin.Comment;

public class CommentVM extends Comment{
	private static final long serialVersionUID = -8802007842767318655L;
	private long likeCounts;
	private boolean isLike;
	public long getLikeCounts() {
		return likeCounts;
	}
	public void setLikeCounts(long likeCounts) {
		this.likeCounts = likeCounts;
	}
	public boolean isLike() {
		return isLike;
	}
	public void setLike(boolean isLike) {
		this.isLike = isLike;
	}
}
