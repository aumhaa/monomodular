import com.cycling74.max.*;

//package lh.tools.jsmin;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class PreProcess extends MaxObject
{

	private static final String[] INLET_ASSIST = new String[]{
		"inlet 1 help"
	};
	private static final String[] OUTLET_ASSIST = new String[]{
		"outlet 1 help"
	};
	
	public PreProcess(Atom[] args)
	{
		declareInlets(new int[]{DataTypes.ALL});
		declareOutlets(new int[]{DataTypes.ALL});
		
		setInletAssist(INLET_ASSIST);
		setOutletAssist(OUTLET_ASSIST);

	}
    
	public void bang()
	{
		processFiles( "c:/Users/amounra/monomodular_git/aumhaa_blocks/common/", "c:/Users/amounra/monomodular_git/aumhaa_blocks/common/preprocessed/", mod_files );
	}
    
	public void inlet(int i)
	{
	}
    
	public void inlet(float f)
	{
	}
    
    
	public void list(Atom[] list)
	{
	}
	static final String include_pattern = "^\"include (.*)\"";
	
	static final Pattern p1 = Pattern.compile( include_pattern );
	
	static HashMap<String, Boolean>	 alreadyIncluded = new HashMap<String, Boolean>();
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String[] mod_files = { 
				"mod"
		};

		processFiles( "c:/Users/amounra/monomodular_git/aumhaa_blocks/common/", "c:/Users/amounra/monomodular_git/aumhaa_blocks/common/preprocessed/", mod_files );
		//processFiles( "c:/development/M4L/livelink/js/", "c:/development/M4L/livelink_exec/js/", livelink_files );
	}

	public static void processFiles( String sourcePath, String destPath, String[] files ) {
		for( String file : files ) {
			String inPath = sourcePath + file + ".js";
			String outPath = destPath + file + ".js";
			
			System.out.println( "Deleting: " + outPath );
			
			alreadyIncluded.clear();
			
			File f = new File( outPath );
			
			if ( !f.delete() ) 
				System.out.println( "Cannot delete: " + outPath );
			
			System.out.println( "Processing: " + inPath + "->" + outPath );
			
			try {
				BufferedReader br = new BufferedReader( new FileReader( inPath ) );
				BufferedWriter bw = new BufferedWriter( new FileWriter( outPath ) );
				
				processFile( file, br, bw, sourcePath );
				
				br.close();
				bw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void processFile( String name, BufferedReader br, BufferedWriter bw, String sourcePath ) throws NumberFormatException, IOException {
		String line;
		
		while( ( line = br.readLine() ) != null ) {
			Matcher m1 = p1.matcher( line );

			if ( m1.find() ) {
				String fname = m1.group( 1 );

				if ( !alreadyIncluded.containsKey( fname ) ) {
					System.out.println( "Including: " + sourcePath + fname );
					
					try {
						BufferedReader br_inc = new BufferedReader( new FileReader( sourcePath + fname ) );
						
						bw.write( "// #include '" + fname + "'\n" );

						processFile( fname, br_inc, bw, sourcePath );
						
						br_inc.close();
					} catch( Exception e ) {
						bw.write( "error( \"Failed to include: " + fname + "\\n\" );\n" );
						System.out.println( e );
					};
					
					alreadyIncluded.put( fname, true );
				} 
				
				// next line
				continue;
			} else
				bw.write( line + "\n" );
		}
	}
}

}



