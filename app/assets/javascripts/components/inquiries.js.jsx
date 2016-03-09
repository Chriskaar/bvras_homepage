var Inquiries = React.createClass({

	getInitialState: function() {
		return {inquirie: this.props.data };
	},

	getDefaultProps: function() {

	},

	addInquirie: function(inquirie) {
		var inquiries = this.state.inquiries.slice();
		inquirie.push(inquirie);
		this.setState({ inquirie: inquirie });
	},

  render: function() {
    return(

    	<div className=''>
    		<table className='table table-hover'>
    			<tbody>
    				{this.state.inquirie.map(function(inquirie){
    					return <Inquirie key={inquirie.id} inquirie={inquirie} />
    				})}
    			</tbody>
    		</table>
    	</div>

    	);
  	}
});
