package services;

import daos.PlantTagDAO;
import entities.PlantTag;

import java.util.Vector;

public class PlantTagService {

        private PlantTagDAO plantTagDAO;
        private static PlantTagService instance;

        private PlantTagService() {
            plantTagDAO = PlantTagDAO.getInstance();
        }

        public static PlantTagService getInstance(){
            if(instance == null){
                instance = new PlantTagService();
            }
            return instance;
        }

        public Vector<PlantTag> getTop6TagHasPlant(){
            return plantTagDAO.getTop6TagHasPlant();
        }



}
