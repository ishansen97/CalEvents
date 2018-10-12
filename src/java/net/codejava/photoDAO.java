package net.codejava;



import java.io.ByteArrayOutputStream;

import java.io.IOException;

import java.io.InputStream;

import java.sql.Blob;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.sql.SQLException;

import java.util.Base64;



public class photoDAO {

    String databaseURL = "    ";

    String user = "root";

    String password = "pass";

    

    public photo get(int id) throws SQLException, IOException {

        photo photo = null;

        

        String sql = "SELECT * FROM photo WHERE photo_id = ?";

        

        try (Connection connection = DriverManager.getConnection(databaseURL, user, password)) {

            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setInt(1, id);

            ResultSet result = statement.executeQuery();

            

            if (result.next()) {

                photo = new photo();

                String photo_id = result.getString("photo_id");

                String album_id = result.getString("album_id");
               
                String photo_name = result.getString("photo_name");

                Blob blob = result.getBlob("photo_type");

                

                ByteArrayOutputStream outputStream;
                String base64Photo_type;
                try (InputStream inputStream = blob.getBinaryStream()) {
                    outputStream = new ByteArrayOutputStream();
                    byte[] buffer = new byte[4096];
                    int bytesRead = -1;
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        
                        outputStream.write(buffer, 0, bytesRead);
                        
                    }   byte[] photo_typeBytes = outputStream.toByteArray();
                    base64Photo_type = Base64.getEncoder().encodeToString(photo_typeBytes);
                }

                outputStream.close();

                

                photo.setphoto_id(photo_id);

                photo.setalbum_id(album_id);
        
                 photo.setphoto_name(photo_name);

                

                photo.setBase64Photo_type(base64Photo_type);

            }         

            

        } catch (SQLException | IOException ex) {


            throw ex;

        }     

        

        return photo;

    }

}


	

	
	
