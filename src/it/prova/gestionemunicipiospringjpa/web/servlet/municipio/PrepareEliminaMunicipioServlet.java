package it.prova.gestionemunicipiospringjpa.web.servlet.municipio;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import it.prova.gestionemunicipiospringjpa.model.Municipio;
import it.prova.gestionemunicipiospringjpa.service.municipio.MunicipioService;

/**
 * Servlet implementation class PrepareEliminaMunicipioServlet
 */
@WebServlet("/PrepareEliminaMunicipioServlet")
public class PrepareEliminaMunicipioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Autowired
	private MunicipioService municipioService;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		SpringBeanAutowiringSupport.processInjectionBasedOnCurrentContext(this);
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PrepareEliminaMunicipioServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("idMunicipio");
		Municipio municipioDaCancellare = null;

		municipioDaCancellare = municipioService.caricaSingoloMunicipio(Long.valueOf(id));
		



		request.setAttribute("municipioAttr", municipioDaCancellare);

		
		request.setAttribute("messaggioConferma", "Cancellazione avvenuta con successo");
		RequestDispatcher rd = request.getRequestDispatcher("municipio/delete.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
