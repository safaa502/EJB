package controllers;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;
import java.util.List;


import dao.IDaoLocale;
import dao.IDaoLocale2;


import entities.Hotel;
import entities.Ville;

/**
 * Servlet implementation class HotelController
 */
@WebServlet("/HotelController")
public class HotelController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @EJB
    private IDaoLocale2<Hotel> Hotelejb;

    @EJB
    private IDaoLocale<Ville> Villeejb;

    public HotelController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null) {
            request.setAttribute("Hotels", Hotelejb.findAll());
            request.setAttribute("villes", Villeejb.findAll());

            RequestDispatcher dispatcher = request.getRequestDispatcher("hotel.jsp");
            dispatcher.forward(request, response);
        }
        else {
        	
        if (action.equals("edit")) {
            request.setAttribute("villes", Villeejb.findAll());
            String hotelId = request.getParameter("id");
            Hotel editHotel = Hotelejb.findById(Integer.parseInt(hotelId));

            request.setAttribute("editHotel", editHotel);

            RequestDispatcher dispatcher = request.getRequestDispatcher("editHotel.jsp");
            dispatcher.forward(request, response);
            
        }	else if (action.equals("byVille")) {
            String villeId = request.getParameter("ville");
            request.setAttribute("villes", Villeejb.findAll());
            if(villeId != null) {
                request.setAttribute("Hotels", Hotelejb.findByVille(Integer.parseInt(villeId)));
            }
            else {
                request.setAttribute("Hotels", Collections.emptyList());
            }
//            request.setAttribute("Hotels", Hotelejb.findByVille(Integer.parseInt(villeId)));


            RequestDispatcher dispatcher = request.getRequestDispatcher("hotelByVille.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("Hotels", Hotelejb.findAll());
            request.setAttribute("villes", Villeejb.findAll());

            RequestDispatcher dispatcher = request.getRequestDispatcher("hotel.jsp");
            dispatcher.forward(request, response);
        }
        }
        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            String nom = request.getParameter("nom");
            String adresse = request.getParameter("adresse");
            String telephone = request.getParameter("telephone");
            String ville_id = request.getParameter("ville");
            Hotelejb.create(new Hotel(0, nom, adresse, telephone, Villeejb.findById(Integer.parseInt(ville_id))));
        } else {
            if (action.equals("delete")) {
                String hotel_id = request.getParameter("id");
                Hotelejb.delete(Hotelejb.findById(Integer.parseInt(hotel_id)));
            } else if (action.equals("update")) {
                String hotel_id = request.getParameter("id");
                Hotel hotelToUpdate = Hotelejb.findById(Integer.parseInt(hotel_id));

                if (hotelToUpdate != null) {
                    String updatedNom = request.getParameter("nom");
                    String updatedAdresse = request.getParameter("adresse");
                    String updatedTelephone = request.getParameter("telephone");
                    String updatedVilleId = request.getParameter("ville");

                    hotelToUpdate.setNom(updatedNom);
                    hotelToUpdate.setAdresse(updatedAdresse);
                    hotelToUpdate.setTelephone(updatedTelephone);

                    Ville updatedVille = Villeejb.findById(Integer.parseInt(updatedVilleId));
                    hotelToUpdate.setVille(updatedVille);

                    Hotelejb.update(hotelToUpdate);
                }
            } else {
                String nom = request.getParameter("nom");
                String adresse = request.getParameter("adresse");
                String telephone = request.getParameter("telephone");
                String ville_id = request.getParameter("ville");
                Hotelejb.create(new Hotel(0, nom, adresse, telephone, Villeejb.findById(Integer.parseInt(ville_id))));
            }
        }

        // Redirect to the hotel.jsp page after handling the POST request
        response.sendRedirect("HotelController");
    }

    
}