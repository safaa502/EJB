package controllers;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import dao.IDaoLocale;

import entities.Ville;

/**
 * Servlet implementation class VilleController
 */
@WebServlet
public class VilleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@EJB
	private IDaoLocale<Ville> Villeejb;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VilleController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if(action == null) {
        	// Your existing code for displaying the list of Ville
            request.setAttribute("villes", Villeejb.findAll());
            ServletContext context = getServletContext();
            context.setAttribute("Villeejb", Villeejb);
            RequestDispatcher dispatcher = request.getRequestDispatcher("ville.jsp");
            dispatcher.forward(request, response);
        }
        
        if (action.equals("edit")) {
            String villeId = request.getParameter("id");
            Ville editVille = Villeejb.findById(Integer.parseInt(villeId));

            request.setAttribute("editVille", editVille);

            RequestDispatcher dispatcher = request.getRequestDispatcher("editVille.jsp");
            dispatcher.forward(request, response);
        } else {
            // Your existing code for displaying the list of Ville
            request.setAttribute("villes", Villeejb.findAll());
            ServletContext context = getServletContext();
            context.setAttribute("Villeejb", Villeejb);
            RequestDispatcher dispatcher = request.getRequestDispatcher("ville.jsp");
            dispatcher.forward(request, response);
        }
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if (action.equals("delete")) {
            String ville_id = request.getParameter("id");
            Villeejb.delete(Villeejb.findById(Integer.parseInt(ville_id)));
        } else if (action.equals("update")) {
            String ville_id = request.getParameter("id");
            Ville villeToUpdate = Villeejb.findById(Integer.parseInt(ville_id));

            if (villeToUpdate != null) {
                String updatedNom = request.getParameter("ville");
                villeToUpdate.setNom(updatedNom);
                Villeejb.update(villeToUpdate);
            }
        } else {
            String nom = request.getParameter("ville");
            Villeejb.create(new Ville(nom));
        }
        
        doGet(request, response);
    }

}