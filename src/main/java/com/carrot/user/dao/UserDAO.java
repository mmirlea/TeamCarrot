package com.carrot.user.dao;

import com.carrot.user.domain.UserDTO;

public interface UserDAO {

	int register(UserDTO dto) throws Exception;

	int emailOverlap(UserDTO dto) throws Exception;

	UserDTO login(UserDTO dto) throws Exception;

}